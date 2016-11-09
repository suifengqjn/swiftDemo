//
//  Teacher.swift
//  构造函数
//
//  Created by qianjn on 2016/10/23.
//  Copyright © 2016年 SF. All rights reserved.
//

import UIKit

class Teacher: Person {

    var ID: String?
    //重载构造函数，使用字典为本类设置初始值
    init(dict: [String: AnyObject]) {
        
        //使用 self 的方法与初始化 自定义的变量不一样
        // KVC 是OC的方法，需要对象在实例化完成后 才能发送消息，所以 super.init 在前面
        super.init()
        setValuesForKeys(dict)
    }
    //未定义的key
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        if key == "id" {
            ID = value as! String?
        }
    }
    
}
