//
//  Student.swift
//  构造函数
//
//  Created by qianjn on 2016/10/23.
//  Copyright © 2016年 SF. All rights reserved.
//

import UIKit

class Student: Person {
    var number:NSNumber
    
    init(name: String, number:NSNumber) {
        
        self.number = number
        super.init(name: name)
        
    }
}
