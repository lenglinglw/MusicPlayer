//
//  UIButton+Extension.swift
//  swift-BatteryBox
//
//  Created by 苏强 on 2018/9/11.
//  Copyright © 2018年 苏强. All rights reserved.
//

import UIKit

extension UIButton {
    
    /// 创建只用设置title的btn
    public class func setButtonTitle(titleStr: String, titleColor: String, font: CGFloat) -> UIButton {
    
        let btn = UIButton(type: .custom)
        btn.setTitle(titleStr, for: .normal)
        btn.setTitleColor(UIColor.colorWithHex(hex: titleColor), for: .normal)
        btn.titleLabel?.font = kAppFont(fontFloat: font)
        return btn
        
    }
    

    
    /// 创建需要title 和 背景图片的btn
    public class func setButtonTitleAndBackGroundImageView (titleStr: String, titleColor: String, font: CGFloat, normalBgImageView: String, selectBgImageView: String) -> UIButton{
        
        let btn = UIButton(type: .custom)
        btn.setTitle(titleStr, for: .normal)
        btn.setTitleColor(UIColor.colorWithHex(hex: titleColor), for: .normal)
        btn.titleLabel?.font = kAppFont(fontFloat: font)
        btn.setBackgroundImage(UIImage(named: normalBgImageView), for: .normal)
        btn.setBackgroundImage(UIImage(named: selectBgImageView), for: .selected)
        return btn
        
    }
    /// 创建设置图片的 btn
    public class func setButtonImageView(imageView:String,selectImageView:String) -> UIButton{
        
        let btn = UIButton(type: .custom)
        btn.setImage(UIImage(named: imageView), for: .normal)
        btn.setImage(UIImage(named: selectImageView), for: .selected)
        return btn
        
    }
}

