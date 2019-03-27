//
//  UILable+Extension.swift
//  swift-BatteryBox
//
//  Created by 苏强 on 2018/9/6.
//  Copyright © 2018年 苏强. All rights reserved.
//

import UIKit

//class UILable_Extension: NSObject {
//
//}
extension UILabel {
    
    public class func initLab(text: String, textColor: String, font: Int) -> UILabel {
        
        let lab = UILabel()
        lab.text = text
        lab.textColor = UIColor.colorWithHex(hex: textColor)
        lab.font = kAppFont(fontFloat: CGFloat(font))
        return lab
        
    }
    
}
