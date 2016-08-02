//
//  SNTableViewController.swift
//  Sina
//
//  Created by qianjn on 16/7/28.
//  Copyright © 2016年 SF. All rights reserved.
//

import UIKit

class SNTableViewController: UITableViewController {

    // 定义变量保存用户是否登录
    var userLogin:Bool = false
    var visitorView: TBVisitorView?
    
    override func loadView() {
        
        userLogin ? super.loadView() : setupVisitor()
        
    }

    /**
     创建访客视图
     */
    private func setupVisitor()
    {
        let customView = TBVisitorView()
        customView.delegate = self
        view = customView;
        visitorView = customView;

        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "注册", style: UIBarButtonItemStyle.plain, target: self, action: #selector(registerBtnClick))
        
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "登录", style: UIBarButtonItemStyle.plain, target: self, action: #selector(loginBtnClick))
        
    }


}



extension SNTableViewController: TBVisitorViewDelegate {
    
    // MARK - TBVisitorViewDelegate
    func registerBtnClick() {
        
    }
    
    
    func loginBtnClick() {
        
    }
}
