//
//  UIColor+Extension.swift
//  swift-BatteryBox
//
//  Created by 苏强 on 2018/9/5.
//  Copyright © 2018年 苏强. All rights reserved.
//

import UIKit

extension UIColor {

    public class func colorWithHex(hex: String, alpha:CGFloat) -> UIColor {
        
            var cleanStr = hex.replacingOccurrences(of: "#", with: "")
        
            if cleanStr.count == 3 {
                cleanStr = "\(cleanStr.strRangeStr(startLocation: 0,endLocation: 1))\(cleanStr.strRangeStr(startLocation: 0,endLocation: 1))\(cleanStr.strRangeStr(startLocation: 0,endLocation: 2))\(cleanStr.strRangeStr(startLocation: 0,endLocation: 2))\(cleanStr.strRangeStr(startLocation: 0,endLocation: 3))\(cleanStr.strRangeStr(startLocation: 0,endLocation: 3))"
            }
            if cleanStr.count == 6 {
                cleanStr += "ff"
            }
            var baseValue:UInt64 = 0
        
            Scanner(string: cleanStr).scanHexInt64(&(baseValue))
        
            let redValue = (Double((baseValue >> 24) & 0xFF)) / 255.0
            let green    = (Double((baseValue >> 16) & 0xFF)) / 255.0
            let blue     = (Double((baseValue >> 8 ) & 0xFF)) / 255.0
        
            return UIColor(red: CGFloat(redValue), green: CGFloat(green), blue: CGFloat(blue), alpha: 1.0)
        }
    
    public class func colorWithHex(hex: String) -> UIColor {

        return colorWithHex(hex: hex, alpha: 1.0)

    }
    
    public class func creatImageWithColor(color:UIColor) -> UIImage {
        
            let rect = CGRect(x: 0.0, y: 0.0, width: 1.0, height: 1.0)
            UIGraphicsBeginImageContext(rect.size)
            let context = UIGraphicsGetCurrentContext()
            context?.setFillColor(color.cgColor)
            context?.fill(rect)
            let image = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            return image!
        
    }
    
}
