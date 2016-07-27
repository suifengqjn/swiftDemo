//
//  Student.swift
//  继承
//
//  Created by qianjn on 16/7/24.
//  Copyright © 2016年 SF. All rights reserved.
//

import UIKit

class Student: Person {
    override func sayHello() -> String {
        return ("hello, i am \(name), i am a student")
    }
}
