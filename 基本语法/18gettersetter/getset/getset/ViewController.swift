//
//  ViewController.swift
//  getset
//
//  Created by qianjn on 16/7/24.
//  Copyright © 2016年 SF. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    
        ///整个项目算是一个命名空间，命名空间内资源共享，不需要引入头文件
        ///因此避免文件名冲突，第三方库最好用cocopods
        
        
        let p = Person()
        
        p.name = "ji"
        p.gender = "man"
        print(p)
    
    
    
    }

    

}

