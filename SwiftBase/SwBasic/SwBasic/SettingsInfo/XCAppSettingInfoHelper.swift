//
//  XCAppSettingInfoHelper.swift
//  SwBasic
//
//  Created by qianjn on 2016/10/24.
//  Copyright © 2016年 SF. All rights reserved.
//

import UIKit


class XCAppSettingInfoHelper: NSObject {

    //前面加class 表示类方法
   class func settingInfo() {
        
        let version = Bundle.main.infoDictionary?["CFBundleShortVersionString"]
        UserDefaults.standard.set(version, forKey: "version_preference")
        
        let build = Bundle.main.infoDictionary?["CFBundleVersion"]
        UserDefaults.standard.set(build, forKey: "build_preference")
    
    }

    
    func environment() -> NSInteger {
        return UserDefaults.standard.value(forKey: "api_env") as! NSInteger
    }
    
    func webDevelopAddress() -> String {
        return UserDefaults.standard.value(forKey: "h5_dev_address") as! String
    }
    
    func cacheCleanTime() -> NSInteger {
        return UserDefaults.standard.value(forKey: "cache_clean") as! NSInteger
    }
    
    func allowDisWifi() -> Bool {
        return UserDefaults.standard.value(forKey: "wifi_allow") as! Bool
    }
    
    
}
