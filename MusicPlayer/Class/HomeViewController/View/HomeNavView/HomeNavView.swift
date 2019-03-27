//
//  HomeNavView.swift
//  MusicPlayer
//
//  Created by 苏强 on 2019/3/25.
//  Copyright © 2019 black. All rights reserved.
//

import UIKit

@objc enum HomeNavViewButtonType: Int8 {
    
    case MusicHouseButton = 1
    case MyButton         = 2
    case FindButton       = 3
    case OrtherButton     = 4
    case MoreButton       = 5
    case Null             = 6
    
}

@objc protocol HomeNavViewDelegate {
    
    @objc optional func HomeNavViewBtnDelegate(homeNavViewButtonType: HomeNavViewButtonType)
    
}

class HomeNavView: UIView {
    
    weak var delegate: HomeNavViewDelegate?
    // 音乐馆
    let musicHouseBtn = HomeNavButton.setButtonTitle(titleStr: "音乐馆", titleColor: "ffffff", font: 19)
    // 我的
    let myBtn         = HomeNavButton.setButtonTitle(titleStr: "我的", titleColor: "ffffff", font: 19)
    // 发现
    let findBtn       = HomeNavButton.setButtonTitle(titleStr: "发现", titleColor: "ffffff", font: 19)
    /// 设置记录上次点击了那个按钮
    var saveLastClick = HomeNavViewButtonType.MusicHouseButton
    
    
    // 设置view的可点击区域
    override var intrinsicContentSize: CGSize {
        
        return UIView.layoutFittingExpandedSize
        
    }
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        musicHouseBtn.tag = Int(HomeNavViewButtonType.MusicHouseButton.rawValue)
        musicHouseBtn.addTarget(self, action: #selector(btnClick(_ :)), for: .touchUpInside)
        musicHouseBtn.titleLabel?.font = kBoldAppFont(19)
        self.addSubview(musicHouseBtn)
        musicHouseBtn.snp.makeConstraints { (m) in
        
            m.center.equalToSuperview()
            m.width.equalTo(kAppWidthValue(width: 60))
            m.height.equalTo(kAppHeightValue(height: 25))
            
        }
//
        myBtn.tag = Int(HomeNavViewButtonType.MyButton.rawValue)
        myBtn.addTarget(self, action: #selector(btnClick(_ :)), for: .touchUpInside)
        self.addSubview(myBtn)
        myBtn.snp.makeConstraints { (m) in
            m.centerY.equalToSuperview()
            m.width.equalTo(kAppWidthValue(width: 50))
            m.height.equalTo(kAppHeightValue(height: 25))
            m.right.equalTo(musicHouseBtn.snp.left).offset(kAppWidthValue(width: -16))
        }
//
        findBtn.tag = Int(HomeNavViewButtonType.FindButton.rawValue)
        findBtn.addTarget(self, action: #selector(btnClick(_ :)), for: .touchUpInside)
        self.addSubview(findBtn)
        findBtn.snp.makeConstraints { (m) in
            m.centerY.equalToSuperview()
            m.width.equalTo(kAppWidthValue(width: 50))
            m.height.equalTo(kAppHeightValue(height: 25))
            m.left.equalTo(musicHouseBtn.snp.right).offset(kAppWidthValue(width: 16))
        }
        
    }
    
    func changeBtnStates(homeNavViewButtonType: HomeNavViewButtonType) {
        
        if homeNavViewButtonType == saveLastClick {
            
            return
            
        }
        
        saveLastClick = homeNavViewButtonType
        
        musicHouseBtn.titleLabel?.font = kAppFont(fontFloat: 19)
        myBtn.titleLabel?.font         = kAppFont(fontFloat: 19)
        findBtn.titleLabel?.font       = kAppFont(fontFloat: 19)
        
        switch homeNavViewButtonType {
            
        case HomeNavViewButtonType.MusicHouseButton:
            
            musicHouseBtn.titleLabel?.font = kBoldAppFont(19)
            self.delegate?.HomeNavViewBtnDelegate?(homeNavViewButtonType: HomeNavViewButtonType.MusicHouseButton)
            break
        case HomeNavViewButtonType.MyButton:
            
            myBtn.titleLabel?.font = kBoldAppFont(19)
            self.delegate?.HomeNavViewBtnDelegate?(homeNavViewButtonType: HomeNavViewButtonType.MyButton)
            break
            
        case HomeNavViewButtonType.FindButton:
            
            findBtn.titleLabel?.font = kBoldAppFont(19)
            self.delegate?.HomeNavViewBtnDelegate?(homeNavViewButtonType: HomeNavViewButtonType.FindButton)
            break
            
        default:
            
            break
        }
        
    }
    
    @objc func btnClick(_ sender: UIButton) {
        
        changeBtnStates(homeNavViewButtonType: HomeNavViewButtonType(rawValue: Int8(sender.tag))!)
        
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
