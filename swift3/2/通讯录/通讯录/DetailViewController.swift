//
//  DetailViewController.swift
//  通讯录
//
//  Created by qianjn on 2016/10/26.
//  Copyright © 2016年 SF. All rights reserved.
//

import UIKit

class DetailViewController: UITableViewController {

    @IBOutlet weak var nameText: UITextField!
    
    
    @IBOutlet weak var phoneText: UITextField!
    
    
    @IBOutlet weak var jobtext: UITextField!
    
    
    //表示闭包的返回值可选
   // var completeCallBack:()->()?
    //闭包可选
    var completeCallBack:(()->())?
    
    var person: Person?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if (person != nil) {
            nameText.text = person?.name
            phoneText.text = person?.phone
            jobtext.text = person?.job
        }
    }

    
    @IBAction func savePerson(_ sender: AnyObject) {
        
        if person == nil {
            person = Person()
        }
        person?.name = nameText.text
        person?.phone = phoneText.text;
        person?.job = jobtext.text
        
//        if completeCallBack != nil {
//            completeCallBack!()
//        }
        
        completeCallBack?()
        
        //这个方法有返回值，_ 忽略一切不关心的内容，不写的话会有警告
        _ = navigationController?.popViewController(animated: true)
        
        
    }

}
