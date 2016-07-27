//
//  ViewController.swift
//  构造
//
//  Created by qianjn on 16/7/25.
//  Copyright © 2016年 SF. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let pe = Person()
        
        print(pe);
        
        let pe2 = Person(name: "zs", age: 12)
        
        print(pe2)
        
        
        let p3 = Person(dict: ["name":"jom", "age": 10])
        print("\(p3.age), \(p3.name)")
        
        
        
    }

    

}

