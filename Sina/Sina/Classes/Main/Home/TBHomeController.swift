//
//  TBHomeController.swift
//  Sina
//
//  Created by qianjn on 16/7/28.
//  Copyright © 2016年 SF. All rights reserved.
//

import UIKit

class TBHomeController: SNTableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if !userLogin {
             visitorView?.setupVisitorInfo(true, imageName: "visitordiscover_feed_image_house", message: "关注一些人，回这里看看有什么惊喜")
            return
        }
       
        setUpNav()
    }

    
    

    
    // MARK: - Navigation

    private func setUpNav() {
        /*
        // left bar button 
        let leftBtn = UIButton()
        leftBtn.setImage(UIImage(named: "navigationbar_friendattention"), for: UIControlState.normal)
        leftBtn.setImage(UIImage(named: "navigationbar_friendattention_highlighted"), for: UIControlState.highlighted)
        leftBtn.sizeToFit()
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: leftBtn)
        
        // right bar button
        let rightBtn = UIButton()
        rightBtn.setImage(UIImage(named: "navigationbar_pop"), for: UIControlState.normal)
        rightBtn.setImage(UIImage(named: "navigationbar_pop_highlighted"), for: UIControlState.highlighted)
        rightBtn.sizeToFit()
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: rightBtn)
         */
        navigationItem.leftBarButtonItem = UIBarButtonItem.createBarButton(imageName: "navigationbar_friendattention", target: self, action: #selector(leftBarClick))
        
        navigationItem.rightBarButtonItem = UIBarButtonItem.createBarButton(imageName: "navigationbar_pop", target: self, action: #selector(rightBarClick))

    }
    
    // MARK: - action
    func leftBarClick() {
        print("ffff")
    }
    
    func rightBarClick() {
        
    }

}
