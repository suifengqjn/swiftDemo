//
//  ViewController.swift
//  运行时加载属性列表
//
//  Created by qianjn on 2016/10/24.
//  Copyright © 2016年 SF. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        Person.getPropertyList()
    }


}

