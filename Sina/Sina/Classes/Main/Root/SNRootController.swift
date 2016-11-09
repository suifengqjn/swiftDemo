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
        tabBar.tintColor = UIColor.orange
        
        // 动态添加子控制器
        buildDynamicContrillers()
    }

    ///ios 7 以后 建议在viewWillAppear 里面设置frame
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        buildPostBtn()
        
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
                
                if (dicArr as AnyObject).count < 4 {
                    
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
        let cls:AnyClass? = NSClassFromString(mmkjStr + "." + childController)
        
        //3. 把类指定成控制器类型
        let VCClass = cls as! UIViewController.Type;
        
        //4. 初始化
        let VC = VCClass.init()
        
        //5. 设置属性并添加到子控制器
        VC.tabBarItem.image = UIImage(named: imageName)
        VC.tabBarItem.selectedImage = UIImage(named: imageName + "_highlighted")
        VC.tabBarItem.title = title
        VC.navigationItem.title = title
        
        let Nav = SNNavigationController()
        Nav.addChildViewController(VC)
        addChildViewController(Nav)
        
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
        addChildControllers(childController: TBHomeController(), title: "", imageName: "")
        addChildControllers(childController: TBHomeController(), title: "发现", imageName: "tabbar_discover")
        addChildControllers(childController: TBHomeController(), title: "我", imageName: "tabbar_profile")
        
        
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

    // MARK: - 懒加载 创建加号 按钮
    private lazy var postBtn: UIButton = {
        
        let btn = UIButton()
        
        btn.setImage(UIImage(named:"tabbar_compose_icon_add"), for: UIControlState.normal)
        btn.setImage(UIImage(named:"tabbar_compose_icon_add_highlighted"), for: UIControlState.selected)
        
        btn.setBackgroundImage(UIImage(named:"tabbar_compose_button"), for: UIControlState.normal);
        btn.setBackgroundImage(UIImage(named:"tabbar_compose_button_highlighted"), for: UIControlState.selected);
        
        btn.addTarget(self, action:#selector(postBtnClick), for: UIControlEvents.touchUpInside)
        
        return btn
        
    }()
    
    // MARK: - 设置加号按钮
    private func buildPostBtn() {
        
        tabBar.addSubview(postBtn)
        
        // 1.计算按钮宽度
        let width = kScreenWidth / CGFloat(viewControllers!.count)
        // 2.创建按钮frame
        let rect = CGRect(x: 0, y: 0, width: width, height: tabBar.bounds.height)
        // 3.设置按钮frame和偏移位
        /// 第一个参数： frame的大小
        /// 第二个参数： x轴方向偏移的大小
        /// 第三个参数： x轴方向偏移的大小
        postBtn.frame = rect.offsetBy(dx: width * 2, dy: 0)
        
    
    }
    
    ///按钮点击事件的调用是由 运行循环 监听并且以消息机制传递的，因此，按钮监听函数不能设置为 private
    // MARK: - 按钮点击
    func postBtnClick() {
        print(#function)
    }
}
