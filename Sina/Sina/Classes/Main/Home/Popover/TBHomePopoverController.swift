//
//  TBHomePopoverController.swift
//  Sina
//
//  Created by qianjn on 16/8/4.
//  Copyright © 2016年 SF. All rights reserved.
//

import UIKit

class TBHomePopoverController: UIViewController {

    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let backGroundView = UIImageView()
        backGroundView.image = UIImage(named: "popover_background")
        backGroundView.frame = CGRect(x: (kScreenWidth - 200)/2, y: 20, width: 200, height: 250)
        self.view.addSubview(backGroundView)
        
        let tableView: UITableView = UITableView()
        tableView.backgroundColor = UIColor.blue()
//        tableView.delegate = self
//        tableView.dataSource = self
        tableView.frame = CGRect(x: (kScreenWidth - 200)/2 + 10, y: 35, width: 200-20, height: 220)
        self.view .addSubview(tableView)
        
    }

    

    

    

}


//extension TBHomePopoverController: UITableViewDelegate, UITableViewDataSource {
//    // MARK: - Table view data source
//    
//     func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 0
//    }
//    
//     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        // #warning Incomplete implementation, return the number of rows
//        return 0
//    }
//    
//    /*
//     override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//     let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
//     
//     // Configure the cell...
//     
//     return cell
//     }
//     */
//}
