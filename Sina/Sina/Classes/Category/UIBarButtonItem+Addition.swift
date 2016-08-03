//
//  UIBarButtonItem+Addition.swift
//  Sina
//
//  Created by qianjn on 16/8/3.
//  Copyright © 2016年 SF. All rights reserved.
//

import UIKit


extension UIBarButtonItem {
    
    ///在func 前面 加 class 相当于 OC的 + 类方法
    class func createBarButton(imageName: String, target: AnyObject?, action: Selector) -> UIBarButtonItem  {
        
        let btn = UIButton()
        btn .addTarget(target, action: action, for: UIControlEvents.touchUpInside)
        btn.setImage(UIImage(named: imageName), for: UIControlState.normal)
        btn.setImage(UIImage(named: imageName + "_highlighted"), for: UIControlState.highlighted)
        btn.sizeToFit()
        return UIBarButtonItem(customView: btn)
        
    }
}
