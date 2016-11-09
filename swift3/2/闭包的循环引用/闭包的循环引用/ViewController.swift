//
//  ViewController.swift
//  闭包的循环引用
//
//  Created by qianjn on 2016/10/16.
//  Copyright © 2016年 SF. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var completionCallBack:(([String]) -> ())?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //单方向引用是不会产生循环引用的
        // 闭包 对self 产生的引用
        //这里就导致的循环引用
//        loadData { (result) in
//            print(self.view)
//        }
        
        
        //解决循环引用的办法
        // 方法1 - OC方式
        /// 注意点1：weak 只能修饰 var， 不能修饰 let
        // weak 在运行时可能会被修改 指向的对象一旦被释放，会自动设置为nil
        weak var weakSelf = self
        loadData { (result) in
            ///注意点2：两种方式的解包差别
            //? : 可选解包（常用语发送消息）
            //! : 强行解包 如果解包的对象已经被释放，强行解包会导致崩溃（常用于 数据计算）
            print(weakSelf?.view)
        }
        
        //方法2 - swift 推荐方式
        // [weak self] 表示 {} 中的 所有 self 都是弱引用 ，注意可选解包
        loadData { [weak self] (result) in
            print(self?.view)
        }
        
        //方法3 - 知道就好
        // [unowned self] 表示{} 中的 所有self 都是 assgined， 不会强引用，但是对象释放，指针地址不会变化
        // 如果对象被释放，继续调用，就会出现野指针
        // 相当于 OC __unsafe_unretain
//        loadData { [unowned self] (result) in
//            print(self.view)
//        }
    }
    
    func loadData(completion:@escaping (([String]) -> ())) -> () {
        
        //使用属性记录闭包 -- self 对闭包 有了引用
        completionCallBack = completion
        DispatchQueue.global().async {
            
            Thread.sleep(forTimeInterval: 4)
            DispatchQueue.main.async {
                completion(["a", "v", "df"])
            }
        }
    }


    deinit {
        print("销毁了")
    }
}

