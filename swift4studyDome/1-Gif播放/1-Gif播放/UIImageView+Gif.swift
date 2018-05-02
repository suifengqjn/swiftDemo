//
//  UIImageView+Gif.swift
//  1-Gif播放
//
//  Created by qianjn on 2017/11/9.
//  Copyright © 2017年 SF. All rights reserved.
//

import UIKit

// 滑动的时候是否停止播放
public var stopAnimationWhenScrollow: Bool = false;



extension UIImageView {
    func gifName(gifName: String) {
        // 1. 把gif 转化成 data
        guard let dataPath = Bundle.main.path(forResource: gifName, ofType: "gif") else { return }
        guard let gifData = NSData(contentsOfFile: dataPath) else { return }
        
        // 2. 把data 转换成CGImageSource 对象
        guard let imageSource = CGImageSourceCreateWithData(gifData, nil) else { return }
        // 2.1 获取图片的个数
        let imageCount = CGImageSourceGetCount(imageSource)
        
        var images = [UIImage]()
        var gifDuration : TimeInterval = 0
        // 3. 遍历所有的图片
        for i in 0..<imageCount {
            // 3.1 取出图片
            guard let cgimage = CGImageSourceCreateImageAtIndex(imageSource, i, nil)  else { return }
            
            let image = UIImage(cgImage: cgimage)
            images.append(image)
            if (i == 0) {
                self.image = image
            }
            // 3.1 取出每张图片持续的时间
            guard let property = CGImageSourceCopyPropertiesAtIndex(imageSource, i, nil) as? NSDictionary else { continue }
            guard let gifDic = property[kCGImagePropertyGIFDictionary] as? NSDictionary else { continue }
            guard let imageDuration = gifDic[kCGImagePropertyGIFDelayTime] as? NSNumber else { continue }
            gifDuration += imageDuration.doubleValue
            
        }
        // 4.设置images属性
        self.animationImages = images
        self.animationDuration = gifDuration
    }
}
