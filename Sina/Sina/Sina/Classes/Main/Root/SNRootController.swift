//
//  SNRootController.swift
//  Sina
//
//  Created by qianjn on 16/7/28.
//  Copyright © 2016年 SF. All rights reserved.
//

import UIKit

class SNRootController: SNTabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        ///sdfsdfasdfasdfasd
        ///注意：IOS7 以后
        tabBar.tintColor = UIColor.orange()
        
        buildControllers()
    }

    
    
    
    
    
    
    // MARK: - 创建首页子控制器
    private func buildControllers() -> Void {
        
        /*  添加一个子控制器基本属性
        let homeVC = TBHomeController()
        homeVC.tabBarItem.image = UIImage(named: "tabbar_home")
        homeVC.tabBarItem.selectedImage = UIImage(named: "tabbar_home_highlighted")
        homeVC.tabBarItem.title = "首页"
        homeVC.navigationItem.title = "首页"
        let homeNav = SNNavigationController()
        homeNav.addChildViewController(homeVC)
        addChildViewController(homeNav)
        */
        
        addChildControllers(childController: TBHomeController(), title: "首页", imageName: "tabbar_home")
        addChildControllers(childController: TBHomeController(), title: "消息", imageName: "tabbar_message_center")
        addChildControllers(childController: TBHomeController(), title: "发现", imageName: "tabbar_discover")
        addChildControllers(childController: TBHomeController(), title: "我", imageName: "tabbar_profile")
        
        //获取命名空间
        let mmkjStr = Bundle.main.infoDictionary!["CFBundleExecutable"] as! String;
        print(mmkjStr);
        
        let cls:AnyClass? = NSClassFromString("Sina." + "TBHomeController")
        
        let VCClass = cls as! UIViewController.Type;
        
        let VC = VCClass.init()
        
        print(VC);
    }
    
    
    private func addChildControllers(childController: UIViewController, title: String, imageName: String) -> Void {
        
        print(childController);
        childController.tabBarItem.image = UIImage(named: imageName)
        childController.tabBarItem.selectedImage = UIImage(named: imageName + "_highlighted")
        childController.tabBarItem.title = title
        childController.navigationItem.title = title
        let homeNav = SNNavigationController()
        homeNav.addChildViewController(childController)
        addChildViewController(homeNav)
        
    }

}
