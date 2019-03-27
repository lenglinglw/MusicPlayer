//
//  HomeSearchView.swift
//  MusicPlayer
//
//  Created by 苏强 on 2019/3/26.
//  Copyright © 2019 black. All rights reserved.
//

import UIKit

class HomeSearchView: UIButton {

    let backgroundView = UIView.initWithBgColor("#61BE82")
    let lab = UILabel.initLab(text: "搜索", textColor: "ffffff", font: 16)
    let iconImage = UIImageView.init(image: UIImage.init(named: ""))
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        self.backgroundColor = navColor
        self.addSubview(backgroundView)
        backgroundView.snp.makeConstraints { (m) in
            m.edges.equalToSuperview().inset(UIEdgeInsets(top: 8.0, left: 8.0, bottom: 8.0, right: 8.0))
        }
        
        backgroundView.addSubview(lab)
        lab.snp.makeConstraints { (m) in
            m.center.equalToSuperview().offset(kAppWidthValue(width: 3))
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
