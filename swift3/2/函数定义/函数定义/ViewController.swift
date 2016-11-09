//
//  ViewController.swift
//  函数定义
//
//  Created by qianjn on 2016/10/15.
//  Copyright © 2016年 SF. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(sum1(x: 4, y: 5))
        
        print(sum2(num1: 1, num2: 2))
        
        print(sum3(2, 4))
        
        print(sum4())
        print(sum4(num1: 9, num2: 9))
        
        print(sum5(num2: 4))
        print(sum5(num1: 7, num2: 8))
        
        demo1()
        demo2()
        demo3()
        
    }

    // MARK: -  函数定义：函数名（形参列表）-> 返回值
    func sum1(x: Int, y: Int) -> Int {
        return x+y;
    }
    
    // MARK: - 外部参数
    //外部参数 就是在 形参前面加一个名字
    //外部参数不会影响函数内部，只是让外面调用更加直观
    func sum2(num1 x: Int, num2 y: Int) -> Int {
        return x+y;
    }
    
    //外部参数如果使用 _ ,在条用函数的时候，会忽略形参的名字
    //在swift中，对于没有用的变量或者结果，度可以用 _ 代替
    
    func sum3(_ x: Int, _ y: Int) -> Int {
        
        for _ in 0..<5 {
            print("hello")
        }
        return x+y;
    }

    // MARK: - 函数默认值（OC没有）
    //函数有两种调用形式，有参和无参
    func sum4(num1 x: Int = 2, num2 y: Int = 9) -> Int {
        return x+y
    }
    //也可以指定某些参数的默认值
    func sum5(num1 x: Int = 2, num2 y: Int) -> Int {
        return x+y
    }
    
    // MARK: - 无返回值
    //主要用在闭包
    /*
     无返回值有三种写法
     - 直接省略
     - ()
     - Void
    */
    
    func demo1()  {
        print("demo1")
    }

    func demo2() -> () {
         print("demo2")
    }
    func demo3() -> Void {
         print("demo3")
    }
}

