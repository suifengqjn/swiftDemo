//
//  Person.swift
//  继承
//
//  Created by qianjn on 16/7/24.
//  Copyright © 2016年 SF. All rights reserved.
//

import UIKit

class Person: NSObject {
    
    var name: String = "tom"
    var age: Int = 0
    
    func sayHello() -> String {
        return("hello, i am \(name)")
    }
}


