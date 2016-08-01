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
    var login:Bool = false
    var visitorView: TBVisitorView?
    
    override func loadView() {
        
        login ? super.loadView() : setupVisitor()
        
    }

    /**
     创建访客视图
     */
    private func setupVisitor()
    {
        visitorView = TBVisitorView()
        visitorView?.delegate = self
        view = visitorView
    }


}



extension SNTableViewController: TBVisitorViewDelegate {
    
    // MARK - TBVisitorViewDelegate
    func registerBtnClick() {
        
    }
    
    
    func loginBtnClick() {
        
    }
}
