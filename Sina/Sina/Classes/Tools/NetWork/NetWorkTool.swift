//
//  NetWorkTool.swift
//  Sina
//
//  Created by qianjn on 16/8/16.
//  Copyright © 2016年 SF. All rights reserved.
//

import UIKit

class NetWorkTool: NSObject {

    //swift中， 类方法中不允许定义静态变量
   
    //swift中 let是线程安全的
    static let instance: NetWorkTool = NetWorkTool()
    
    class func shareManager() ->NetWorkTool {

        return instance

    }
    
    
}
