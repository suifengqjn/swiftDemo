//
//  DemoLabel.swift
//  01_懒加载
//
//  Created by qianjn on 2016/10/30.
//  Copyright © 2016年 SF. All rights reserved.
//

import UIKit

class DemoLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    //使用XIB SB 时的入口
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        //禁止XIB / SB 使用本类
        //如果需要支持XIB SB 就注释下面这一行
        fatalError("init(coder:) has not been implemented")
    }

}
