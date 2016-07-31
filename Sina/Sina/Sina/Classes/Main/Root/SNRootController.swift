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
        
        buildDynamicContrillers()
    }

    
    // MARK: - 通过json数据初始化，创建首页子控制器
    
    private func buildDynamicContrillers() -> Void {
        
        //1. 获取路径
        let path = Bundle.main.pathForResource("MainVCSettings", ofType: "json")
        //2. 通过路径创建NSData
        if let jsonPath = path {
            let jsonData = NSData(contentsOfFile: jsonPath)
            
            
            //异常处理格式
            // throw是Xcode7最明显的一个变化, Xcode7之前都是通过传入error指针捕获异常,
            //Xocode7开始通过try/catch捕获异常
            //try  : 发生异常会调到catch中继续执行
            //try! : 发生异常直接崩溃
            do {
               let dicArr =  try JSONSerialization.jsonObject(with: jsonData! as Data, options: JSONSerialization.ReadingOptions.mutableContainers)
                
                if dicArr.count < 4 {
                    
                    buildControllers()
                    return
                }
                 // swift 遍历字典时候需要明确指明数组中的数据类型
                for dict in dicArr as! [[String : String]] {
                    // 由于addChildVC方法参数不能为nil, 但是字典中取出来的值可能是nil, 所以需要加上!
                    addChildControllers(childController: dict["vcName"]!, title: dict["title"]!, imageName: dict["imageName"]!)
                    
                }
                
            } catch  {   //解析json文件失败走这里
                
                buildControllers()
                
            }
            
        } else {
            
            buildControllers()
        }
        
        
        
    }
    
    // MARK: -  字符串创建控制器
    private func addChildControllers(childController: String, title: String, imageName: String) -> Void {
        
        //1. 动态获取命名空间
        let mmkjStr = Bundle.main.infoDictionary!["CFBundleExecutable"] as! String;
        
        //2. 通过字符串转类
        let cls:AnyClass? = NSClassFromString(mmkjStr + "." + "TBHomeController")
        
        //3. 把类指定成控制器类型
        let VCClass = cls as! UIViewController.Type;
        
        //4. 初始化
        let VC = VCClass.init()
        
        //5. 设置属性并添加到子控制器
        VC.tabBarItem.image = UIImage(named: imageName)
        VC.tabBarItem.selectedImage = UIImage(named: imageName + "_highlighted")
        VC.tabBarItem.title = title
        VC.navigationItem.title = title
        let homeNav = SNNavigationController()
        homeNav.addChildViewController(VC)
        addChildViewController(homeNav)
        
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
