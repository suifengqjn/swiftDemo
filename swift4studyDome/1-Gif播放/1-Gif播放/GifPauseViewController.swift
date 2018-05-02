//
//  GifPauseViewController.swift
//  1-Gif播放
//
//  Created by qianjn on 2017/11/10.
//  Copyright © 2017年 SF. All rights reserved.
//

import UIKit

class GifPauseViewController: UIViewController {

    var dataSource: NSMutableArray = NSMutableArray()
    var timeinterval: TimeInterval = 0
    var calink: CADisplayLink!
    var totalduration: Double = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white

        setUpGif()
        print(dataSource)
        
        
        let imageView = UIImageView()
        imageView.frame = CGRect(x: 0, y: 50, width: self.view.frame.size.width, height: 200)
        self.view.addSubview(imageView)

        timeinterval = NSDate().timeIntervalSince1970
        calink = CADisplayLink(target: self, selector: #selector(refrshImageView))
        calink.add(to: RunLoop.main, forMode: .commonModes)
        
    }

    
    fileprivate func setUpGif() {
        // 1. 把gif 转化成 data
        guard let dataPath = Bundle.main.path(forResource: "demo", ofType: "gif") else { return }
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
            // 3.1 取出每张图片持续的时间
            guard let property = CGImageSourceCopyPropertiesAtIndex(imageSource, i, nil) as? NSDictionary else { continue }
            guard let gifDic = property[kCGImagePropertyGIFDictionary] as? NSDictionary else { continue }
            guard let imageDuration = gifDic[kCGImagePropertyGIFDelayTime] as? NSNumber else { continue }
            gifDuration += imageDuration.doubleValue
            totalduration = gifDuration
            let imageDic = NSMutableDictionary()
            imageDic.setValue(image, forKey: "image");
            imageDic.setValue(gifDuration, forKey: "duration")
            dataSource.add(imageDic)
            
        }
    }
    
    
    @objc fileprivate func refrshImageView() {
        var inter = NSDate().timeIntervalSince1970 - timeinterval
        if (inter - totalduration) >= 0 {
            inter = 0;
            timeinterval = NSDate().timeIntervalSince1970
        }
        
        
        
        
        
        
        
       
    }
    
    deinit {
        calink.isPaused = true
        calink.remove(from: RunLoop.main, forMode: .commonModes)
        calink.invalidate()
        calink = nil
    }

}
