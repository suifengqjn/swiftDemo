//
//  ViewController.swift
//  网络请求
//
//  Created by qianjn on 2016/10/25.
//  Copyright © 2016年 SF. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = URL(string: "https://www.baidu.com")
        
        ///闭包与OC的区别：闭包中的参数需要自己写，如果参数不需要，用 _ 忽略
        URLSession.shared.dataTask(with: url!) { (result, _, error) in
            
           guard let data = result else {
            
            print("网络请求失败\(error)")
            return
            
            }
            
            let html = String(data: data, encoding: .utf8)
            print(html)
            
        }.resume()
        
        
        
        
        _ = Person(name: "ad", age: 23)
        
        
        
    }


}

