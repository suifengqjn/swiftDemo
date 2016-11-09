//
//  RootViewController.swift
//  UITableVIew
//
//  Created by qianjn on 16/7/27.
//  Copyright © 2016年 SF. All rights reserved.
//

import UIKit

class RootViewController: UIViewController {

    override func loadView() {
        let tv = UITableView();
        tv.frame = UIScreen.main().bounds
        tv.delegate = self
        tv.dataSource = self
        
        view = tv
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    // MARK: - 懒加载
    lazy var dataList:[String] = {
        return ["ds", "asd", "wer", "dfr", "we", "we"]
    }()

    
    

}

///官方推荐将数据源代理方法单独放到一个扩展中
///extension 相当于OC 的category

extension RootViewController: UITableViewDelegate,UITableViewDataSource
{
    // MARK: - UITableVIewDelegate
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cellIden")
        if cell == nil {
            cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "cellIden")
        }
        
        cell?.textLabel?.text = dataList[indexPath.row]
        
        return cell!
    }
}
