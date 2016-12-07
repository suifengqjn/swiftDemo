//
//  ViewController.swift
//  网络请求
//
//  Created by qianjn on 2016/11/14.
//  Copyright © 2016年 SF. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let path = "http://meizi.leanapp.cn/category/All/page/1"
        
        XCRequest.shareManager().getWithPath(path: path, paras: nil, completion:{
        (result, success) in
            
            
            if success {
                
            } else {
                
            }
            
        })
        
        XCRequest.shared.getWithPath(path: path, paras: nil, completion: {_,_ in })
        
    
    }

    
    
    

}

