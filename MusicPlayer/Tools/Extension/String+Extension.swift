//
//  String+Extension.swift
//  swift-BatteryBox
//
//  Created by 苏强 on 2018/9/5.
//  Copyright © 2018年 苏强. All rights reserved.
//
import UIKit
import Foundation

extension String {
/// 字符串切割
    func strRangeStr(startLocation: Int, endLocation: Int) -> String {
        
        let start = self.index(self.startIndex, offsetBy: startLocation)
        let end   = self.index(self.startIndex, offsetBy: endLocation)
        let str   = self[start..<end]
        return String(str)
        
    }
/// 计算文字宽度
    func widthWithStr(font: CGFloat, height: CGFloat) -> CGFloat {
        
        guard self.count > 0 else {
            
            return 0
        }
        let strFont = kAppFont(fontFloat: font)
        
        let size = CGSize(width: 0, height: CGFloat(MAXFLOAT))
        let text = self as NSString
        let rect = text.boundingRect(with: size, options:.usesLineFragmentOrigin, attributes: [.font : strFont], context:nil)
        
        return rect.size.width
    }
    // 时间戳转化时间
    func TimeStampToStringTime(dateFormat: String) -> String {
        
        let timeSta: TimeInterval = Double(self)!/Double(1000)
        let dfmatter = DateFormatter()
        dfmatter.dateFormat = dateFormat
        
        let date = NSDate(timeIntervalSince1970: timeSta)
        
        print(dfmatter.string(from: date as Date))
        return dfmatter.string(from: date as Date)
        
    }
    
    /// 判断是不是Emoji
    ///
    /// - Returns: true false
    func containsEmoji()->Bool{
        for scalar in unicodeScalars {
            switch scalar.value {
            case 0x1F600...0x1F64F,
                 0x1F300...0x1F5FF,
                 0x1F680...0x1F6FF,
                 0x2600...0x26FF,
                 0x2700...0x27BF,
                 0xFE00...0xFE0F:
                return true
            default:
                continue
            }
        }
        
        return false
    }
    
    /// 判断是不是Emoji
    ///
    /// - Returns: true false
    func hasEmoji()->Bool {
        
        let pattern = "[^\\u0020-\\u007E\\u00A0-\\u00BE\\u2E80-\\uA4CF\\uF900-\\uFAFF\\uFE30-\\uFE4F\\uFF00-\\uFFEF\\u0080-\\u009F\\u2000-\\u201f\r\n]"
        let pred = NSPredicate(format: "SELF MATCHES %@",pattern)
        return pred.evaluate(with: self)
    }
    
    /// 判断是不是九宫格
    ///
    /// - Returns: true false
    func isNineKeyBoard()->Bool{
        let other : NSString = "➋➌➍➎➏➐➑➒"
        let len = self.count
        for _ in 0 ..< len {
            if !(other.range(of: self).location != NSNotFound) {
                return false
            }
        }
        
        return true
    }
    
    /// 然后是去除字符串中的表情
    ///
    /// - Parameter text: text
    func disable_emoji(text : NSString)->String{
        do {
            let regex = try NSRegularExpression(pattern: "[^\\u0020-\\u007E\\u00A0-\\u00BE\\u2E80-\\uA4CF\\uF900-\\uFAFF\\uFE30-\\uFE4F\\uFF00-\\uFFEF\\u0080-\\u009F\\u2000-\\u201f\r\n]", options: NSRegularExpression.Options.caseInsensitive)
            
            let modifiedString = regex.stringByReplacingMatches(in: text as String, options: NSRegularExpression.MatchingOptions(rawValue: 0), range: NSMakeRange(0, text.length), withTemplate: "")
            
            return modifiedString
        } catch {
            print(error)
        }
        return ""
    }
    
    // 计算时长
    func setConcreteTime() -> String {
        
        let num = Int(self)!/1000
        
        let hourTime   = num / 3600
        let minTime    = (num - hourTime * 3600) / 60
        let secondTime = num - hourTime * 3600 - minTime * 60
        
        var hourStr   = ""
        var minStr    = ""
        var secondStr = ""
        
        if hourTime > 10 {
            hourStr = "\(hourTime)时"
        }else {
            hourStr = "0\(hourTime)时"
        }
        
        if minTime > 10 {
            minStr = "\(minTime)分"
        }else {
            minStr = "0\(minTime)分"
        }
        
        if secondTime > 10 {
            secondStr = "\(secondTime)秒"
        }else {
            secondStr = "0\(secondTime)秒"
        }
        
        return "\(hourStr)\(minStr)\(secondStr)"
        
    }
}


