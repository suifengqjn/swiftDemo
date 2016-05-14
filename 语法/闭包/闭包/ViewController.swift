//
//  ViewController.swift
//  闭包
//
//  Created by qianjianeng on 16/5/8.
//  Copyright © 2016年 SF. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
           //格式
        let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]

        func backwards(s1: String, s2: String) -> Bool {
            return s1 > s2
        }
        var reversed = names.sort(backwards)
        
        //这里举一个子线程操作，回到主线程更新UI的栗子
        dispatch_async(dispatch_get_global_queue(0, 0)) {
            print(NSThread.currentThread());
            print("耗时操作");
            
            dispatch_async(dispatch_get_main_queue(), {
               
                print(NSThread.currentThread());
                print("回到主线程");

            });
        }
        
        
        func someFunctionThatTakesAClosure(closure: () -> Void) {
            // 函数体部分
            print("sdfsd");
        }
        
        // 以下是不使用尾随闭包进行函数调用
        someFunctionThatTakesAClosure({
            // 闭包主体部分
        })
        
        // 以下是使用尾随闭包进行函数调用
        someFunctionThatTakesAClosure() {
            // 闭包主体部分
        }
        
        
        loadData { 
            
            print("接受到回调");
        }
        
    }

    
    //模仿网络请求数据，得到数据后返回
    func loadData(fnished:() -> ()) {
        print("耗时操作------");
        fnished();
    }

}

