//
//  SinaOAuthController.swift
//  Sina
//
//  Created by qianjn on 16/9/10.
//  Copyright © 2016年 SF. All rights reserved.
//

import UIKit

class SinaOAuthController: SNViewController {

    let WB_APP_KEY = "2054319149"
    let WB_APP_SECRET = "e343c830c9cb3fd31f98e39056495d4e"
    let WB_REDIRECT_URL = "http://gcblog.github.io"
    
    override func loadView() {
        view = webVIew
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "微博登入"
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "关闭", style: UIBarButtonItemStyle.plain, target: self, action:#selector(close))

        // Do any additional setup after loading the view.
        let urlStr = "https://api.weibo.com/oauth2/authorize?client_id=\(WB_APP_KEY)&redirect_uri=\(WB_REDIRECT_URL)"
        let wurl = NSURL(string: urlStr)
        let request = NSURLRequest(url: wurl! as URL)
            
        webVIew.loadRequest(request as URLRequest)
        
    }

    func close() {
        dismiss(animated: true, completion: nil)
    }
    // MARK: - 懒加载
    private lazy var webVIew: UIWebView = {
       
        let webV = UIWebView()
        return webV;
    }()
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
