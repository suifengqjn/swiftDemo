//
//  Person.swift
//  构造函数
//
//  Created by qianjn on 2016/10/19.
//  Copyright © 2016年 SF. All rights reserved.
//

import UIKit

class Person: NSObject {

    var name: String
    
    ///最简单的必选属性的构造函数
    ///构造函数的目的，给自己分配空间并设置初始值
    ///属性的初始化放在super.init前面
    /// 重写父类方法需要加override
    override init () {
        
        name = "default name:Tom"
        
        super.init()
    }
    
    /// 如果实现了 构造函数的重载，并且没有重写构造函数，那么系统不再提供原始的init()函数
    /// 方法重载（类似OC自定义初始化方法）
    init(name: String) {
        self.name = name
        super.init()
    }
    
}
