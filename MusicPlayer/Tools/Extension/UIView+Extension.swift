//
//  UIView+Extension.swift
//  swift-BatteryBox
//
//  Created by 苏强 on 2018/9/20.
//  Copyright © 2018年 苏强. All rights reserved.
//

import UIKit


extension UIView {
    
    public class func initWithBgColor(_ bgColor: String) -> UIView {
        
        let view = UIView()
        view.backgroundColor = UIColor.colorWithHex(hex: bgColor)
        return view
        
    }
    
}
