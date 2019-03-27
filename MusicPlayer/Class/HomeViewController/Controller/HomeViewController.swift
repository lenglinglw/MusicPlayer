//
//  HomeViewController.swift
//  MusicPlayer
//
//  Created by 苏强 on 2019/3/22.
//  Copyright © 2019 black. All rights reserved.
//

import UIKit

class HomeViewController: BaseViewController {

    let scrollView = UIScrollView.init()
    /// 头部导航栏
    let homeNavView = HomeNavView.init()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        setNav()
        drawUI()

    }
    
    func setNav() {
        
        homeNavView.delegate = self
        homeNavView.frame = CGRect(x: 0, y: 0, width: kAppWidth, height: 44)
        self.navigationController?.navigationBar.barTintColor = navColor
        self.navigationItem.titleView = homeNavView
        
    }
    
    func drawUI() {
        
        let searchView = HomeSearchView()
        self.view.addSubview(searchView)
        searchView.snp.makeConstraints { (m) in
            m.top.equalToSuperview()
            m.width.equalTo(kAppWidth)
            m.height.equalTo(kAppHeightValue(height: 44))
        }
        
        scrollView.delegate               = self
        scrollView.alwaysBounceVertical   = false
        scrollView.alwaysBounceHorizontal = true
        scrollView.frame = CGRect(x: 0, y: kAppHeightValue(height: 44), width: kAppWidth, height: kAppHeight)
        // 设置可滚动范围
        scrollView.contentSize = CGSize(width: 3 * kAppWidth, height: 0)
//        scrollView.contentInset = UIEdgeInsets.init(top: 20, left: 20, bottom: 20, right: 20)
        // 设置滚动条隐藏
        scrollView.showsHorizontalScrollIndicator = false
        // 翻页属性
        scrollView.isPagingEnabled = true
        // 当前显示区域
        scrollView.contentOffset = CGPoint(x: kAppWidth, y: 0)

        self.view.addSubview(scrollView)

        let view = UIView.initWithBgColor("c1c3c9")
        view.frame = CGRect(x: 0, y: 0, width: kAppWidth, height: kAppHeight)
        scrollView.addSubview(view)

        let viewOne = UIView.initWithBgColor("b2b2b2")
        viewOne.frame = CGRect(x: kAppWidth, y: 0, width: kAppWidth, height: kAppHeight)
        scrollView.addSubview(viewOne)
//
    }
    
}

extension HomeViewController: HomeNavViewDelegate {
    
    func HomeNavViewBtnDelegate(homeNavViewButtonType: HomeNavViewButtonType) {
        
        switch homeNavViewButtonType {
            
        case .MusicHouseButton:
            
            self.scrollView.contentOffset = CGPoint(x: kAppWidth, y: 0)
            break
            
        case .MyButton:
            
            self.scrollView.contentOffset = CGPoint(x: 0, y: 0)
            break
        
        case .FindButton:
            
            self.scrollView.contentOffset = CGPoint(x: kAppWidth * 2, y: 0)
            break
            
        default: break
            
        }
        
    }
    
}

extension HomeViewController: UIScrollViewDelegate {
    
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        
        print("停止滚动,scrollview.frame.x = \(scrollView.contentOffset.x)")
        
        if scrollView.contentOffset.x == 0.0 {
            
            self.homeNavView.changeBtnStates(homeNavViewButtonType: HomeNavViewButtonType.MyButton)
            
        } else if scrollView.contentOffset.x == kAppWidth {
            
            self.homeNavView.changeBtnStates(homeNavViewButtonType: HomeNavViewButtonType.MusicHouseButton)
            
        } else if scrollView.contentOffset.x == kAppWidth * 2 {
            
            self.homeNavView.changeBtnStates(homeNavViewButtonType: HomeNavViewButtonType.FindButton)
            
        }
        
    }
    
}
