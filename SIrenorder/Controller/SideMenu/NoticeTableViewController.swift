//
//  NoticeTableViewController.swift
//  SIrenorder
//
//  Created by Dustin on 2020/08/21.
//  Copyright © 2020 Dustin. All rights reserved.
//

import UIKit

class NoticeTableViewController: UITableViewController {
    let networkModel = CallRequest()
    let networkURL = NetWorkURL()
    
    var noticeList = [NoticeModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(123128930218093821093213)
        networkModel.get(method: .get, url: networkURL.noticeURL) { (json) in
            if json["result"].boolValue {
                
                
                for item in json["notice"].array! {
                    let noticeModel = NoticeModel(notice_code: item["notice_code"].stringValue, notice_date: item["notice_date"].stringValue, title: item["title"].stringValue, content: item["content"].stringValue, notice_id: item["notice_id"].intValue)
                    
                    
                    self.noticeList.append(noticeModel)
                }
                
                print(self.noticeList)
                self.tableView.reloadData()
                
                
            }
        }
        
        
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return noticeList.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if noticeList[section].open == true {
            return 1 + 1
            
        }else{
            return 1
            
        }
        
        
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 60
        } else {
            return 250
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    
 
}
