//
//  XCRequest.swift
//  网络请求
//
//  Created by qianjn on 2016/11/14.
//  Copyright © 2016年 SF. All rights reserved.
//

import UIKit

class XCRequest: NSObject {

    
    //单例
//    static let instance: XCRequest = XCRequest()
//    
//    class func shareManager() ->XCRequest {
//        
//        return instance
//        
//    }
    
    static let shared: XCRequest = {
        
        // 实例化对象
        let instance = XCRequest()
        
        // 设置响应反序列化支持的数据类型
        //instance.responseSerializer.acceptableContentTypes?.insert("text/plain")
        
        // 返回对象
        return instance
    }()
    
    
    
    
    
    func getWithPath(path: String,param: Dictionary<String,Any>?,completion: @escaping ((_ result: Any?, _ success:Bool) -> ())) {
        
        let url = URL(string: path.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)!)
        if let para = param {
            //对参数进行处理
            print(para)
        } else {
            
        }
        let session = URLSession.shared
        
        let dataTask = session.dataTask(with: url!) { (data, respond, error) in
            
            if let data = data {
                
                if let result = try? JSONSerialization.jsonObject(with: data, options: .allowFragments){
                    
                    completion(result,true)
                }
            }else {
                
                completion(error,false)
            }
        }
        dataTask.resume()
    }
    
    
    
    
    
    func postWithPath(path: String,paras: Dictionary<String,Any>?,success: @escaping ((_ result: Any) -> ()),failure: @escaping ((_ error: Error) -> ())) {
        
        let url = URL(string: path)
        var request = URLRequest.init(url: url!)
        request.httpMethod = "POST"
        print(path)
        request.httpBody = path.data(using: .utf8)
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request) { (data, respond, error) in
            
            if let data = data {
                
                if let result = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) {
                    
                    success(result)
                }
                
            }else {
                failure(error!)
            }
        }
        dataTask.resume()
    }
    
    
}
