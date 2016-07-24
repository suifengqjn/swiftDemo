//
//  ViewController.swift
//  懒加载
//
//  Created by qianjn on 16/7/24.
//  Copyright © 2016年 SF. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    ///懒加载格式： lazy 后面 + 一个闭包
    ///注意： 1.必须用var 2.闭包后面+（）
    //in 和前面的代码可以省略
    
    lazy var dataList: [String] = {
       () -> [String]
        in
        return ["zero"]
    }()
    
    //in 和前面的代码可以省略
    lazy var dataList2: [String] = {
        return ["zero2"]
    }()

    
    ///另一种写法
    let demofunc = {
        () -> [String]
        in
        return ["tom", "sd"]
    }
    lazy var dataLiat3:[String] = self.demofunc()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print(dataList)
        print(dataList2)
        print(dataLiat3)
    }

}

