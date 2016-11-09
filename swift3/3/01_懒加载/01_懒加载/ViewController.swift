//
//  ViewController.swift
//  01_懒加载
//
//  Created by qianjn on 2016/10/30.
//  Copyright © 2016年 SF. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // 正常的变量写法
    var label = DemoLabel()
    // 懒加载日常开发写法
    lazy var label2:DemoLabel = DemoLabel()
    lazy var array:[String] = ["asd"]
    
    
    
    //懒加载完整写法
    lazy var label3  = { () -> DemoLabel in

        let la = DemoLabel()
        
        return la
    }()
    
    lazy var dataList2: [String] = {
        return ["zero2"]
    }()
    
    /// 与OC懒加载的区别：这里的懒加载只会执行一次，如果中途被设置成nil，也不会再次执行
    override func viewDidLoad() {
        super.viewDidLoad()
        
        label.text = "hello"
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = UIColor.red
        label.sizeToFit()
        label.center = self.view.center
        self.view.addSubview(label)
        
        
        
        label2.text = "hellofff"
        label2.font = UIFont.systemFont(ofSize: 15)
        label2.textColor = UIColor.red
        label2.sizeToFit()
        label2.center = CGPoint(x: 100, y: 100)
        self.view.addSubview(label2)
        
        label3.text = "adfaf"
        label3.textColor = UIColor.gray
        label3.sizeToFit()
        label3.center = CGPoint(x: 300, y: 100)
        self.view.addSubview(label2)
        print(array, dataList2)
        
    }


}

