//
//  ViewController.swift
//  02-只读属性(计算型属性)
//
//  Created by qianjn on 2016/10/31.
//  Copyright © 2016年 SF. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let p = Person()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        p.name = "adad"
        print(p.name)
        print(p.name2)
        print(p.name3)
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        p.name = "change"
        print(p.name2)
        print(p.name3)
        
    }


}

