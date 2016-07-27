//
//  Person.swift
//  构造
//
//  Created by qianjn on 16/7/25.
//  Copyright © 2016年 SF. All rights reserved.
//

import UIKit

class Person: NSObject {

    /// 定义属性如果没有初始化，就必须在后面加上一个？
    /// 如果在构造方法中对属性进行了初始化，就不用写？
    var name: String?
    
    /*
 
     注意点：
     如果是定义一个“对象属性”， 那么后面可以写？
     如果是定义一个“基本数据类型”，那么最好直接赋值为 0 
     因为super.init() 方法在分配存储空间的时候，如果属性是对象，如果可选与否，都会分配空间
     如果是基本数据类型，并且可选，那么super.init() 不会为其分配存储空间
    */
    
    var age: Int = 0
    
    ///重写构造方法
    override init() {
        self.name = "tom"
        age = 30
    }
    
    
    
    ///自定义构造方法
    ///swift中有方法重载的概念
    ///允许有同名的方法，只要方法的形参或者返回值不一样即可
    init(name:String, age:Int) {
        self.name = name
        self.age = age
    }
    ///如果自定义了构造方法，而没有重写构造方法，那么构造方法将失效，只能用自定义构造
    
    
    
    ///字典转模型
    init(dict:[String: NSObject]) {
        
        ///在构造方法中使用KVC给属性赋值，必须先调用super.init()
        ///目的是为了在赋值前给属性分配存储空间

        super.init()
        setValuesForKeys(dict)
    }
    
}
