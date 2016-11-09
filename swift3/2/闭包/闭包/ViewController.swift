//
//  ViewController.swift
//  闭包
//
//  Created by qianjn on 2016/10/15.
//  Copyright © 2016年 SF. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        demo1()
        bibao1()
        //尾随闭包
        // bibao3(completion: <#T##([String]) -> ()#>)
        bibao3 { (result) in
            print(result)
        }
        //按照函数格式编写
        bibao3(completion: { (result) -> () in
            print(result)
        })
        
        
        /// 注意：OC中可以用 {}区分变量作用域，但是swift不行，{}在swfit中作为尾随闭包的形式存在
    }
    
    // MARK: - 闭包
    func bibao1() -> Void {
        
        //1. 最简单的闭包
        let b1 = {
          print("bibao1")
        };
        
        b1()
        
        //2 带参数的闭包
        // 参数，返回值，实现代码都写在{}中
        //需要使用一个关键字 ‘in’ 来分隔定义和实现
        //定义： {形参列表 -> 返回值类型 in 实现代码}
        let b2 = { (x: Int) -> () in
            print("bibao2")
            
        }
        b2(122)
        
        //3 带参数和返回值的闭包
        let b3 = { (x: Int) -> Int in
            return x*2
        }
        
        print(b3(12))
    }
    
    
    // MARK: - 用常量 记录 函数
    func demo1() {
        
        let fu = sum1
        
        print(fu(3, 4))
        
    }
    
    func sum1(x: Int, y: Int) -> Int {
        return x + y
    }

    // MARK: - 尾随闭包
    // 定义：如果函数的最后一个参数是闭包，函数参数可以提前结束，最后一个参数直接使用{}包装的代码
    func bibao3(completion:@escaping (_ result:[String]) -> ()) -> () {
        DispatchQueue.global().async {
            print("耗时操作")
            
            let json = ["wolail", "新闻", "娱乐"]
            
            DispatchQueue.main.async {
                completion(json)
            }
        }
    }

}

