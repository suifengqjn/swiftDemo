//
//  ViewController.swift
//  UITableView
//
//  Created by qianjn on 16/5/14.
//  Copyright © 2016年 SF. All rights reserved.
//

import UIKit

class ViewController: UIViewController{

    //吧控制器的view替换成tableView
    override func loadView() {
        
        let tablev = UITableView();
        tablev.frame = UIScreen.mainScreen().bounds
        tablev.delegate = self;
        tablev.dataSource = self;
        view = tablev;
    }
    
    //MARK: - 懒加载
    lazy var dataList:[String] = {
        return["sd","sdfasdf","sdfsd","safsdf"]
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

}





extension ViewController:UITableViewDelegate,UITableViewDataSource
{
    // MARK: - delegate
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataList.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCellWithIdentifier("asas")
        
        if cell == nil {
            cell = UITableViewCell(style: UITableViewCellStyle.Value1, reuseIdentifier: "asas")
        }
        
        cell?.textLabel?.text = dataList[indexPath.row];
        
        return cell!;
    }
}
