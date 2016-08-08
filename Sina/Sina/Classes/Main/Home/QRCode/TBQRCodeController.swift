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
    override func viewDidLoad() {
        super.viewDidLoad()

        QRTabbar.selectedItem = QRTabbar.items![0]
    }

    @IBAction func leftBtnClick(_ sender: AnyObject) {
        dismiss(animated: true, completion: nil)
    }
    
}
