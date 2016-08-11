//
//  TBQRCodeController.swift
//  Sina
//
//  Created by qianjn on 16/8/8.
//  Copyright © 2016年 SF. All rights reserved.
//

import UIKit

class TBQRCodeController: UIViewController {

    @IBOutlet weak var QRTabbar: UITabBar!
    
    //冲击波视图
    @IBOutlet weak var scanView: UIImageView!
    
    //容器高度
    @IBOutlet weak var containHeight: NSLayoutConstraint!
    
    //冲击波顶部约束
    @IBOutlet weak var scanViewTop: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        QRTabbar.selectedItem = QRTabbar.items![0]
        QRTabbar.delegate = self
    }

    @IBAction func leftBtnClick(_ sender: AnyObject) {
        dismiss(animated: true, completion: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
        startAnimation()

    }
    
    
    private func startAnimation() {
        self.scanViewTop.constant = -self.containHeight.constant
        self.scanView.layoutIfNeeded()
        
        UIView.animate(withDuration: 3.0) {
            self.scanViewTop.constant = 0
            UIView.setAnimationRepeatCount(Float(INT_MAX))
            self.scanView.layoutIfNeeded()
            
        }
    }
    
    
    
    
    
    
}



extension TBQRCodeController:UITabBarDelegate {
    func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        print(item)
        // 1. 修改容器的高度
        if item.tag == 1 {   //二维码
            self.containHeight.constant = 200
        } else {        //条形码
            self.containHeight.constant = 100
        }
        //2.停止动画
        self.scanView.layer.removeAllAnimations()
        
        //开始动画
        startAnimation()
        
    }
}
