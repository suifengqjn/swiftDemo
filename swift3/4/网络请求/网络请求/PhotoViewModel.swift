//
//  PhotoViewModel.swift
//  网络请求
//
//  Created by qianjn on 2016/11/28.
//  Copyright © 2016年 SF. All rights reserved.
//

import UIKit
import YYModel
class PhotoViewModel: NSObject {

    /// 微博模型数组懒加载
    lazy var dataList = [PhotoModel]()
    /// 上拉刷新错误次数
    private var pullupErrorTimes = 0

    
    
    /// - parameter pullup:     是否上拉刷新标记
    /// - parameter completion: 完成回调[网络请求是否成功, 是否刷新表格]
    func loadStatus(pullup: Bool, completion: @escaping (_ isSuccess: Bool) ->()){
        let path = "http://meizi.leanapp.cn/category/All/page/1"
        XCRequest.shared.getWithPath(path: path, paras: nil, completion:{(result, success) in
        
            guard let array = NSArray.yy_modelArray(with: PhotoModel.self, json: result ?? [PhotoModel]()) else {
                completion(success)
                return
            }
            
            self.dataList += array
            
            completion(success)
            
        
        })
        
        
    }
    
}
