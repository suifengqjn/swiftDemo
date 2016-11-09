//
//  TBRootController.swift
//  SwBasic
//
//  Created by qianjn on 2016/10/24.
//  Copyright © 2016年 SF. All rights reserved.
//

import UIKit

class TBRootController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let vc1 = UIViewController()
        //vc1.tabBarItem = UITabBarItem(title: <#T##String?#>, image: <#T##UIImage?#>, selectedImage: <#T##UIImage?#>)
        addChildViewController(vc1)
        printLog(message: "自定义输出")
    }

    func printLog<T>(message:T,
    file:String = #file,
    method:String = #function,
    line:Int = #line){
    #if DEBUG
    print("\((file as NSString).lastPathComponent)[\(line)],\(method):\(message)")
    #endif
    }
    

}
