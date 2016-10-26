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
    }

}
