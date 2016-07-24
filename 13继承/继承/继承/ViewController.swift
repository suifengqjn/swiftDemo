//
//  ViewController.swift
//  继承
//
//  Created by qianjn on 16/7/24.
//  Copyright © 2016年 SF. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let p = Person()
        p.name = "tomdd"
        print(p.name, p.sayHello())
        
        
        //Student 对父类进行方法重写
        
        ///阻止方法或属性被重写(final)
        //(比如 final var ， final func ， final class func ， fianl subscript )。
        let stu = Student()
        stu.name = "jja"
        print(stu.sayHello())
    }

    


}

