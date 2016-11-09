//
//  ViewController.swift
//  GCD
//
//  Created by qianjn on 2016/10/15.
//  Copyright © 2016年 SF. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        loadData()
        loadData2()
        
        
    }


    func loadData() -> () {
        
        //异步子线程
        DispatchQueue.global().async {
            print("耗时操作 \(Thread.current)")
            //主线程异步回调
            DispatchQueue.main.async {
               print("更新UI \(Thread.current)")
            }
        }
    }
    
    
    func loadData2() -> () {
        
        let queue = DispatchQueue(label: "my_queue")
        ///休眠
        Thread.sleep(forTimeInterval: 2.0)
        queue.async {
            print("耗时操作2 \(Thread.current)")
            DispatchQueue.main.async {
                 print("更新UI2 \(Thread.current)")
            }
        }
    }
}

