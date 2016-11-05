//
//  TTLabel.swift
//  03-Didset设置模型数据
//
//  Created by qianjn on 2016/11/2.
//  Copyright © 2016年 SF. All rights reserved.
//

import UIKit

class TTLabel: UILabel {

    var per: PersonModel? {
        
        ///相当于OC的 setter方法，不需要设置 _成员变量 = 值
        didSet {
            self.text = per?.name
        }
    }

}
