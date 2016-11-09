//
//  ListTableViewController.swift
//  通讯录
//
//  Created by qianjn on 2016/10/26.
//  Copyright © 2016年 SF. All rights reserved.
//

import UIKit

class ListTableViewController: UITableViewController {

    var dataArr = [Person]()
    override func viewDidLoad() {
        super.viewDidLoad()

        // 闭包里面需要使用self 来指定是谁的变量
        loadData { (list) in
            self.dataArr += list
            self.tableView.reloadData()
        }
    }

    //模拟异步加载数据，利用闭包回调
    private func loadData(complete:@escaping ([Person]) -> ()) -> () {
        DispatchQueue.global().async {
            print("加载数据中")
            Thread.sleep(forTimeInterval: 2)
            var array:[Person] = [Person]()
            for i in 0..<10 {
                let p = Person()
                p.name = "zhangsna" + "\(i)"
                p.phone = "139" + String(format: "%06d", arc4random_uniform(1234567))
                p.job = "boss"
                array.append(p)
            }
            
            //回到主线程
            DispatchQueue.main.async {
             complete(array)
            }
        }
    }
    
    
    // MARK: - 跳转
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       
        //swift 类型转换 用 as
        /// as 后面 加！还是？ 由前面的类型决定
        let vc = segue.destination as! DetailViewController
        
        if segue.identifier == "addpersonIden" {  //跳转到添加人
            
            vc.completeCallBack = { [weak vc] in   //解决循环引用
                guard let p = vc?.person else {
                    return
                }
                
                self.dataArr .insert(p, at: 0)
                self.tableView .reloadData()
            }
            
        } else if segue.identifier == "gotolidtDetail" { //跳转到详情页
           
            
            /// if let / guard let 判空语句 一律使用 ？
            if let indexP = sender as? IndexPath {
                //进来就表示一定有值
                vc.person = dataArr[indexP.row]
                vc.completeCallBack = {
                    //刷新当前行
                    self.tableView .reloadRows(at: [indexP], with: .automatic)
                }
                
            }
        }
        
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArr.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellIden", for: indexPath)
        cell.textLabel?.text = dataArr[indexPath.row].name
        cell.detailTextLabel?.text = dataArr[indexPath.row].phone
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
      performSegue(withIdentifier: "gotolidtDetail", sender: indexPath)
    }

}
