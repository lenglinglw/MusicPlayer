//
//  StaticPlayer.swift
//  MusicPlayer
//
//  Created by 苏强 on 2019/3/22.
//  Copyright © 2019 black. All rights reserved.
//

@_exported import UIKit
@_exported import SnapKit

// 通用颜色
let kWhiteColor = UIColor.white
let kBlackColor = UIColor.blue


/// 判断是否为流海屏
let isAboveIphoneX = UIApplication.shared.statusBarFrame.height > 20 ? true : false

/// 屏幕宽
let kAppWidth = UIScreen.main.bounds.width

/// 屏幕高
let kAppHeight = UIScreen.main.bounds.height

/// 宽高比例
let kAppWidthRatio = (kAppWidth / 375.0)
let kAppHeightRatio = (kAppHeight / 667.0)

/// 根据宽高比算出所需的宽高
func kAppWidthValue(width:CGFloat) -> CGFloat {
    
    return kAppWidthRatio * width;
    
}

func kAppHeightValue(height:CGFloat) -> CGFloat {
    
    return kAppHeightRatio * height
    
}

/// 常用颜色
let navColor = UIColor.colorWithHex(hex: "#4AF2A1")

/// font根据屏幕宽度调节大小
public func kAppFont(fontFloat:CGFloat) -> UIFont {
    
    return UIFont.systemFont(ofSize: kAppWidthValue(width:CGFloat(fontFloat)))
    
}
/// font 系统字体加粗
public func kBoldAppFont(_ fontFloat: CGFloat) -> UIFont {
    
    return UIFont.boldSystemFont(ofSize: kAppWidthValue(width:CGFloat(fontFloat)))
    
}
