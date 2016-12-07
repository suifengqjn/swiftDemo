//
//  ViewController.swift
//  guardLetIfLet
//
//  Created by qianjn on 2016/12/3.
//  Copyright © 2016年 SF. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
     
        let pe = Person()
        
//        相当于OC中用if来判断某个值是不是为空
//        我认为这个语法最大的好处是避免了写大量的 ？！，
//        用来判断的这个属性必须是可选的
//        guard 与 if 的区别是 guard只有在条件不满足的时候才会执行这段代码
        
        
        guard let _:String = pe.name else {
            
            return
        }
        
        //同时判断多个
        guard let _ = pe.name, let _ = pe.title else {
            return
        }
        
        
        
        if let name = pe.name {
            print(name)
        } else {
            return
        }


        
    }

    


}

