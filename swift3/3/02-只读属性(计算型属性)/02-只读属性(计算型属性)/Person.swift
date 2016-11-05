//
//  Person.swift
//  02-只读属性(计算型属性)
//
//  Created by qianjn on 2016/10/31.
//  Copyright © 2016年 SF. All rights reserved.
//

import UIKit

class Person: NSObject {

    var name: String?
    // 只重写 get 方法 就是只读属性
    var name1: String {
        get {
            return "老王"
        }
    }
    
    // 只读属性的简写
    // 也叫计算型属性 本身不保存内容，每次都是重新计算
    var name2: String {
         return self.name ?? "" + "花花"
    }
    
    //懒加载会分配空间并保存结果
    lazy var name3: String = {
       
        return self.name ?? "" + "花花"
    }()
    
}
