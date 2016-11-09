//
//  UITextFeild+Ext.swift
//  网络请求
//
//  Created by qianjn on 2016/10/25.
//  Copyright © 2016年 SF. All rights reserved.
//

import UIKit

//extension 相当于Oc的category
extension UITextField {
    //带有默认值的参数外面可以随意组合
    convenience init(frame: CGRect, placeholder: String, fontSize:CGFloat = 14) {
        
        self.init(frame:frame)
        
        self.borderStyle = .roundedRect
        self.placeholder = placeholder
        self.font = UIFont.systemFont(ofSize: fontSize)
    }
}
