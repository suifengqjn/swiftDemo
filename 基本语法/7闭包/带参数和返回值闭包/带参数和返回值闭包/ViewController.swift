//
//  ViewController.swift
//  带参数和返回值闭包
//
//  Created by qianjn on 16/7/24.
//  Copyright © 2016年 SF. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        weak var weakSelf = self
        
        weakSelf?.view.backgroundColor = UIColor.red()
        
        block1 { () -> Int in
            return 4
        }
        
        
    }
    
    
    func block1(numCount:() -> Int) {
        
        for i in 0...numCount {
            print(i)
        }
        
    }


}

