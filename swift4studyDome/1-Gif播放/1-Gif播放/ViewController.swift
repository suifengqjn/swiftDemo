//
//  ViewController.swift
//  1-Gif播放
//
//  Created by qianjn on 2017/11/8.
//  Copyright © 2017年 SF. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let imageView = UIImageView()
        imageView.frame = CGRect(x: 0, y: 50, width: self.view.frame.size.width, height: 200)
        self.view.addSubview(imageView)
        imageView.gifName(gifName: "test")
        imageView.animationRepeatCount = 5
        // 5. 开始播放
        imageView.startAnimating()
        
        
        
        // 1. 把gif文件 转化成 data
        guard let dataPath = Bundle.main.path(forResource: "test", ofType: "gif") else { return }
        guard let gifData = NSData(contentsOfFile: dataPath) else { return }
        
        
//        /// 使用webview播放
//        let webview = UIWebView()
//        webview.frame = CGRect(x: 0, y: 300, width: self.view.frame.size.width, height: 200)
//        webview.scalesPageToFit = true
//        webview.load(gifData as Data, mimeType: "image/gif", textEncodingName: String(), baseURL: NSURL() as URL)
//        self.view.addSubview(webview)
        
        
        
        let btn = UIButton(type: .custom)
        btn.frame = CGRect(x: 100, y: self.view.frame.size.height - 150, width: 100, height: 50)
        btn.setTitle("GifPasue", for: .normal)
        btn.backgroundColor = UIColor.gray
        btn.addTarget(self, action: #selector(gifPause), for: .touchUpInside)
        self.view.addSubview(btn)

    }


    @objc fileprivate func gifPause() {
        let gifVc = GifPauseViewController()
        self.navigationController?.pushViewController(gifVc, animated: true)
    }
}

