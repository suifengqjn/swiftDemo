//
//  ViewController.swift
//  属性
//
//  Created by qianjn on 16/7/24.
//  Copyright © 2016年 SF. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    ///计算属性
    struct Point {
        var x = 0.0, y = 0.0
    }
    struct Size {
        var width = 0.0, height = 0.0
    }
    struct Rect {
        var origin = Point()
        var size = Size()
        var center: Point {
            get {
                let centerX = origin.x + (size.width / 2)
                let centerY = origin.y + (size.height / 2)
                return Point(x: centerX, y: centerY)
            }
            set(newCenter) {
                origin.x = newCenter.x - (size.width / 2)
                origin.y = newCenter.y - (size.height / 2)
            }
        }
    }

    ///简写设置器（setter）声明
    //如果一个计算属性的设置器没有为将要被设置的值定义一个名字，那么他将被默认命名为 newValue 。下面是结构体 Rect 的另一种写法，其中利用了简写设置器声明的特性。
    struct AlternativeRect {
        var origin = Point()
        var size = Size()
        var center: Point {
            get {
                let centerX = origin.x + (size.width / 2)
                let centerY = origin.y + (size.height / 2)
                return Point(x: centerX, y: centerY)
            }
            set {
                origin.x = newValue.x - (size.width / 2)
                origin.y = newValue.y - (size.height / 2)
            }
        }
    }
    
    ///只读计算属性
    struct Cuboid {
        var width = 0.0, height = 0.0, depth = 0.0
        var volume: Double {
            return width * height * depth
        }
    }
    
    
    //属性申明
    internal
    var name: String?
    var gender: String = "man"
    
    private
    let age: Int = 23
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        name = "Tom"
        print(name)
        print(gender)
        print(age)
        
        
        
        test()
        test2()
    }

    func test() {
        
        var square = Rect(origin: Point(x: 0.0, y: 0.0),
                          size: Size(width: 10.0, height: 10.0))
        _ = square.center
        square.center = Point(x: 15.0, y: 15.0)
        print("square.origin is now at (\(square.origin.x), \(square.origin.y))")

        

    }
    
    
    
    
    ///属性观察者
    class StepCounter {
        var totalSteps: Int = 0 {
            willSet(newTotalSteps) {
                print("About to set totalSteps to \(newTotalSteps)")
            }
            didSet {
                if totalSteps > oldValue  {
                    print("Added \(totalSteps - oldValue) steps")
                }
            }
        }
    }
    ///totalSteps 的 willSet 和 didSet 观察者会在每次属性被赋新值的时候调用。就算新值与当前值完全相同也会如此。
    func test2() {
        
        let stepCounter = StepCounter()
        stepCounter.totalSteps = 200
        stepCounter.totalSteps = 300;
        
        
    }
    
    
   

}

