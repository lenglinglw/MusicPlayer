//
//  RuntimeMethod.swift
//  MusicPlayer
//
//  Created by 苏强 on 2019/3/22.
//  Copyright © 2019 black. All rights reserved.
//

import UIKit

class RuntimeMethod: NSObject {

    static let runtimeMethod = RuntimeMethod()
    
    public func methodExchange(cls: AnyClass, originalSelector: Selector, exchangedSelector: Selector) {
        
        let originalSelectorMethod  = class_getInstanceMethod(cls, originalSelector)
        let exchangedSelectorMethod = class_getInstanceMethod(cls, exchangedSelector)
        
        let isAdd = class_addMethod(cls, originalSelector, method_getImplementation(exchangedSelectorMethod!), method_getTypeEncoding(exchangedSelectorMethod!))
        
        // isAdd 为 NO时,证明需要添加的方法已经存在,则直接交换A,B方法
        if isAdd {
            
            class_replaceMethod(cls, exchangedSelector, method_getImplementation(originalSelectorMethod!), method_getTypeEncoding(originalSelectorMethod!))
            
        } else {
            
            method_exchangeImplementations(originalSelectorMethod!, exchangedSelectorMethod!)
            
        }
        
        
    }
    
}
