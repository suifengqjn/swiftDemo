//
//  Person.swift
//  运行时加载属性列表
//
//  Created by qianjn on 2016/10/24.
//  Copyright © 2016年 SF. All rights reserved.
//

import UIKit

class Person: NSObject {

    var name: String?
    var age: Int = 0
    var sex: String?
    //可选基本数据类型 或 private属性 运行时获取不到
    var height: Int?
    private var title: String?
    
    class func getPropertyList() -> [String] {
        
        var count: UInt32 = 0
        var array: [String]? = []
        //获取类的属性列表
        let list = class_copyPropertyList(self, &count)
        print("属性的数量 \(count)")
//        for i in 0..<Int(count) {
//            
//            //根据下表获取属性(objc_property_t?)
//            let pty = list?[i]
//            
//            //获取属性的C语言字符串 名称
//            let cName = property_getName(pty!)
//            
//            //转换成string 字符窜
//            let name = String(utf8String: cName!)
//            
//            print(name)
//            array?.append(name!)
//            
//        }
        
        ///代码优化
        for i in 0..<Int(count) {
            
            
            ///使用guard 语法，一次判断每一项是否有值，只要有一向为nil，就不会再继续
            guard let pty = list?[i],
                let cName = property_getName(pty),
                let name = String(utf8String: cName)
            else {
                continue
            }
            
            print(name)
            array?.append(name)
            
        }
        
        
        //释放C语言对象
        free(list)
        
        return array!
    }
}
