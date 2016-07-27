//
//  Person.swift
//  getset
//
//  Created by qianjn on 16/7/24.
//  Copyright © 2016年 SF. All rights reserved.
//

import UIKit

class Person: NSObject {

    ///实际开发，不建议这么写
    var _name:String?
    var name: String? {
        get {
            return _name
        }
        //外界给属性赋值，值就会保存到newValue中
        set {
            _name = newValue
        }
    }
    
    ///推荐这么写
    var gender: String?{
        //设置值完毕之后调用
        //swift中用didset 来替代 oc setter 方法
        didSet {
            print("gender-----\(gender)")
        }
    }
    
    ///如果只重写了get方法，成为计算型属性，
    //对应OC的只读属性
    //特点： 不占用内存
    var age: Int {
        get {
            return 20
        }
    }
    
}
