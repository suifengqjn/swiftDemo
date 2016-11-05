//
//  Bundle+extension.swift
//  命名空间
//
//  Created by qianjn on 2016/11/2.
//  Copyright © 2016年 SF. All rights reserved.
//

import Foundation

extension Bundle {
    
    func nameSpacea() -> String {
        //return Bundle.main.infoDictionary?["CFBundleName"] as? String ?? ""
        return infoDictionary?["CFBundleName"] as? String ?? ""
        
    }
    
    // 计算型属性
    // 没有参数有返回值的时候， 用计算型属性更加合适
    var nameSpace: String {
        return infoDictionary?["CFBundleName"] as? String ?? ""
    }
    
    
}
