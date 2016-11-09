//
//  ViewController.swift
//  构造函数
//
//  Created by qianjn on 2016/10/19.
//  Copyright © 2016年 SF. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var anum: Int?
    var aint: NSInteger?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let per = Person()
        
        print(per.name)
        
        let stu = Student(name: "zhangsan", number: 2)
        print(stu.name, stu.number)
        

        let tea = Teacher(dict:["id": "12" as AnyObject,"name": "teacher li" as AnyObject])
        print(tea.name);
        
    }


}

