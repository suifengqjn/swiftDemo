//
//  TBNavTitleButton.swift
//  Sina
//
//  Created by qianjn on 16/8/4.
//  Copyright © 2016年 SF. All rights reserved.
//

import UIKit

class TBNavTitleButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setTitleColor(UIColor.darkGray(), for: UIControlState())
        setImage(UIImage(named: "navigationbar_arrow_down"), for: UIControlState())
        setImage(UIImage(named: "navigationbar_arrow_up"), for: UIControlState.selected)
        self.sizeToFit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
   override func layoutSubviews() {
        super.layoutSubviews()
        /*
        /// 这么写会出问题，layoutSubviews 可能会调用多次
        //在原来的基础上偏移位置
        titleLabel?.frame.offsetInPlace(dx: -(imageView?.bounds.size.width)!, dy: 0)
        imageView?.frame.offsetInPlace(dx: (titleLabel?.bounds.size.width)!, dy: 0)
         */
    
        ///swift 中可以直接修改结构体中单个的值
        titleLabel?.frame.origin.x = 0
        imageView?.frame.origin.x = titleLabel!.bounds.size.width + 2
    }

}
