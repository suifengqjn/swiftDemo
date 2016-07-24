//
//  ViewController.swift
//  方法
//
//  Created by qianjn on 16/7/24.
//  Copyright © 2016年 SF. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        ///类和结构体也可以定义方法 ，与oc的不同之处
        
        let ct: Counter = Counter()
        ct.increment(by: 3)
        print(ct)
        
        ct.reset()
        print(ct)
        
    }

    ///实例方法
    /// Counter 类定义了三个实例方法：
//    increment每次给计数器增加 1；
//    increment(by: Int)按照特定的整型数量来增加计数器；
//    reset会把计数器重置为零。
    class Counter {
        var count = 0
        func increment() {
            count += 1
        }
        func increment(by amount: Int) {
            count += amount
        }
        func reset() {
            count = 0
        }
    }

    
    
    
    ///self属性， 能不写就不写
    //可以使用 self属性来区分形式参数名和属性名。,还有闭包中会用到self
    struct Point {
        var x = 0.0, y = 0.0
        func isToTheRightOf(x: Double) -> Bool {
            return self.x > x
        }
    }

    ///在实例方法中修改值类型
    //结构体和枚举是值类型。默认情况下，值类型属性不能被自身的实例方法修改。
    
    //你可以选择在 func关键字前放一个 mutating关键字来使用这个行为：
    struct Pointcu {
        var x = 0.0, y = 0.0
        mutating func moveByX(deltaX: Double, y deltaY: Double) {
            x += deltaX
            y += deltaY
        }
    }

    ///在异变方法里指定自身
    struct Pointc22 {
        var x = 0.0, y = 0.0
        mutating func moveBy(x deltaX: Double, y deltaY: Double) {
            self = Pointc22(x: x + deltaX, y: y + deltaY)
        }
    }


    ///类型方法 看文档老半天，p也没看懂

}

