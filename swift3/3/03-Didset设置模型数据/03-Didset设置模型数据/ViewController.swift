//
//  ViewController.swift
//  03-Didset设置模型数据
//
//  Created by qianjn on 2016/11/2.
//  Copyright © 2016年 SF. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let per = PersonModel()
        per.name = "xiaohua"
        
        let label = TTLabel()
        label.frame = CGRect(x: 100, y: 100, width: 100, height: 20)
        label.per = per
        self.view.addSubview(label)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

