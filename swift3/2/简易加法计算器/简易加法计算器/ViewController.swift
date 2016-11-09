//
//  ViewController.swift
//  简易加法计算器
//
//  Created by qianjn on 2016/10/17.
//  Copyright © 2016年 SF. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var testFeild1:UITextField?
    var testFeild2:UITextField?
    var restltLabel:UILabel?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        buildUI()
    }

    //计算结果
    func calcu() {
        print(testFeild1?.text)
        
        guard let num1 = Int(testFeild1?.text ?? ""),
            let num2 = Int(testFeild2?.text ?? "")
        else {
            return
        }
        
        restltLabel?.text = "\(num1 + num2)"
    }
    func buildUI() {
        
        testFeild1 = UITextField(frame: CGRect(x: 10, y: 50, width: 60, height: 40))
        testFeild1?.borderStyle = .roundedRect
        testFeild1?.text = "0"
        view.addSubview(testFeild1!)
        
        let addLabel = UILabel(frame: CGRect(x: 70, y: 50, width: 20, height: 40))
        addLabel.text = "+"
        view.addSubview(addLabel)
        
        testFeild2 = UITextField(frame: CGRect(x: 90, y: 50, width: 60, height: 40))
        testFeild2?.borderStyle = .roundedRect
        testFeild2?.text = "0"
        view.addSubview(testFeild2!)
        
        let eqLabel = UILabel(frame: CGRect(x: 150, y: 50, width: 20, height: 40))
        eqLabel.text = "="
        view .addSubview(eqLabel)
        
        restltLabel = UILabel(frame: CGRect(x: 170, y: 50, width: 60, height: 40))
        restltLabel?.textAlignment = .center
        restltLabel?.text = "0"
        view.addSubview(restltLabel!)
        
        
        let  btn = UIButton(type: UIButtonType(rawValue: 0)!)
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        btn.setTitle("计算", for: UIControlState.normal)
        btn.setTitleColor(UIColor.black, for: .normal)
        btn.sizeToFit()
        btn.center = view.center
        btn.addTarget(self, action: #selector(calcu), for: .touchUpInside)
        view.addSubview(btn)
        
        
    }
    
    
    
    
}

