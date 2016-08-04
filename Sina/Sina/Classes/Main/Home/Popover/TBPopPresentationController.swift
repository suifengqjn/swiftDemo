//
//  TBPopPresentationController.swift
//  Sina
//
//  Created by qianjn on 16/8/4.
//  Copyright © 2016年 SF. All rights reserved.
//

import UIKit
@available(iOS 8.0, *)

class TBPopPresentationController: UIPresentationController {
    
   /// presentedViewController  被展现控制器
    /// presentingViewController  发起控制器
    /// 负责实现转场动画的对象
    override init(presentedViewController: UIViewController, presenting presentingViewController: UIViewController?) {
        super.init(presentedViewController: presentedViewController, presenting: presentingViewController)
    }
    
    
    override func containerViewWillLayoutSubviews() {
        // containerView  容器视图
        // presentedView  被展现的视图
        presentedView()?.frame = CGRect(x: 100, y: 50, width: 200, height: 300)
        
        
        containerView?.insertSubview(coverView, at: 0)
    }
    
    
    //MARK: - 懒加载蒙版
    private  lazy var coverView: UIView = {
        let cView = UIView()
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissVC))
        cView.addGestureRecognizer(tap)
        cView.frame = UIScreen.main().bounds
        cView.backgroundColor = UIColor(white: 0.0, alpha: 0.2)
        return cView
    }()
    
    
    func dismissVC() {
        presentedViewController.dismiss(animated: true, completion: nil)
    }
}

