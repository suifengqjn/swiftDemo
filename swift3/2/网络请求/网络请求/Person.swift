//
//  Person.swift
//  网络请求
//
//  Created by qianjn on 2016/10/25.
//  Copyright © 2016年 SF. All rights reserved.
//

import UIKit

class Person: NSObject {

    var name: String?
    var age: Int = 0
    var weight: Float = 0
    /// 1. 便利构造函数允许返回 nil(init后面需要加上？)
    //- 正常的构造函数一定会创建对象
    //- 判断给定的参数符合条件才创建对象，减少内存开销
    /// 2. 只有便利构造函数才使用 'self.init' 构造当前对象
    
    convenience init?(name:String,age: Int) {
        
        if age > 100 {
            return nil
        }
        
        self.init()
        self.name = name
        self.age = age
        
    }
    
    // 没有func -> 不让调用
    // 没有（）-> 不让重载
    // 相当于 OC dealloc
    deinit {
        
        // 1. 跟踪对象销毁
        // 2. 必须释放
        /**
          - 通知
          - KVO 
          - NSTimer / CADisplayLink
        */
    }
    
}
