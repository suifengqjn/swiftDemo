//
//  ViewController.swift
//  闭包
//
//  Created by qianjn on 16/7/23.
//  Copyright © 2016年 SF. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        ///闭包基本格式
        ///如果没有参数和返回值，in前面和in可以省略
        /*
         in 用于区分形参返回值 和执行代码
        {
               (形参列表) -> (返回值)
               in
               //需要执行的代码
        }
        */
        
        /// 1
        //闭包可以写在（）里面或者外面
        
        loadData (finished: {
            print("第一种闭包");
        })
        
        
        loadData () {
            print("第一种闭包");
        }
        
        loadData { 
            print("第一种闭包");

        }
        
        ///2
         loadData2(num: 10, finished: {
            print("第2种闭包");

        })
        
        loadData2(num: 10) { 
            print("第2种闭包");

        }
        
        
        ///3
        loadData3(num: 3) { (str: String) in
            print(str)
        }
        
        
    }
    
    
    //模仿请求数据
    func loadData(finished:() -> ()){
        print("执行操作");
        //回调
        finished()
    }
    
    
    func loadData2(num: Int, finished: () -> ()) {
        print("执行haoshi操作");
        //回调
        finished()

    }
    
    
    func loadData3(num: Int, finished: (String) -> ()) {
        finished("sdsd")
    }
    
    func loadData4(str: String, finised:() -> Bool) {
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    
        
        
    
    }


}

