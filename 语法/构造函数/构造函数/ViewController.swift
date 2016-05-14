//
//  ViewController.swift
//  构造函数
//
//  Created by qianjianeng on 16/5/13.
//  Copyright © 2016年 SF. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        let p1 = Person()
        
        print("\(p1.name),\(p1.age)")
        
        let p2 = Person(name: "as", age: 22)
        
        print("\(p2.name),\(p2.age)")
        
        
        let p3 = Person(dict: ["name":"asd", "age": 44])
        print("\(p3.name),\(p3.age)")
        
        
    }

    


}

