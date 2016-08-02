//
//  TBProfileController.swift
//  Sina
//
//  Created by qianjn on 16/7/28.
//  Copyright © 2016年 SF. All rights reserved.
//

import UIKit

class TBProfileController: SNTableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        if !userLogin
        {
            visitorView?.setupVisitorInfo(false, imageName: "visitordiscover_image_profile", message: "登录后，你的微博、相册、个人资料会显示在这里，展示给别人")
            print(" this is profilew")
        }
        


    }



}
