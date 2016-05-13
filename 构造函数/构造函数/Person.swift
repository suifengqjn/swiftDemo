//
//  Person.swift
//  构造函数
//
//  Created by qianjianeng on 16/5/13.
//  Copyright © 2016年 SF. All rights reserved.
//

import UIKit

class Person: NSObject {

    //swift中，属性必须要初始化，如果不初始化，就要在后面加上?，
    //只要在构造方法中对属性进行了初始化，就不需要写？
    var age:Int = 0
    var name:String?
    
    //注意点：
    //如果定义一个对象属性，那么可以在后面加个？
    //如果定义一个基本数据类型，那么最好赋值为0
    //因为在调用super.init()方法，如果是一个可选的对象属性，系统会给它分配存储空间，儿如果是一个可选的基本数据类型属性，不会分配存储空间
    
    
    //override 重写父类方法
    override init() {
        self.name = "lj"
        self.age = 10
    }
    
    //自定义构造方法
    //swift中有方法重载的概念，允许方法名形同，只要形参或者返回值不一样即可
    //如果自定义了构造方法，却没有重写父类方法，这个类就没有了父类的初始化方法

    init(name:String,age:Int) {
        self.name = name
        self.age = age
    }
    
    //字典转模型初始化对象
    init(dict:[String:NSObject]) {
        
        //如果在构造方法中想要给属性赋值，就必须先执行super.init()
        //调用super.init()的目的就是为了在赋值前给属性分配存储空间
        super.init()
        setValuesForKeysWithDictionary(dict)
    }
}
