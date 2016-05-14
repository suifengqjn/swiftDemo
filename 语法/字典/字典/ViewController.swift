//
//  ViewController.swift
//  字典
//
//  Created by qianjianeng on 16/5/14.
//  Copyright © 2016年 SF. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        
        // updateValue返回一个可选类型, 如果字典中不存在需要更新的key, 那么返回nil, 如果存在返回原始值
        var dict10 = ["name":"lnj", "age":30]
        if let orignal = dict10.updateValue("iverson", forKey: "name")
        {
            print(dict10["name"]!)
            print(orignal)
        }

        print(dict10)
        
        
        var dict2 = ["name": "wangwu", "age": 80, "title": "boss"]
        for (k, v) in dict2 {
            dict2.updateValue(v, forKey: k)
        }
        print(dict2)
        
        var dict3 = ["name" : "jianeng"];
        dict3["name"] = "sss";
        print(dict3)

    }

    

}

