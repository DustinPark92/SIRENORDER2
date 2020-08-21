//
//  NoticeTableViewController.swift
//  SIrenorder
//
//  Created by Dustin on 2020/08/21.
//  Copyright © 2020 Dustin. All rights reserved.
//

import UIKit

private let topCell = "NoticeTitleTableViewCell"
private let bottomCell = "NoticeTableViewCell"

class NoticeTableViewController: UITableViewController {
    let networkModel = CallRequest()
    let networkURL = NetWorkURL()
    
    var noticeList = [NoticeModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
        
        let notice = noticeList[indexPath.section]
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: topCell, for: indexPath) as! NoticeTitleTableViewCell
            
            
            cell.title.text = notice.title
            
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: bottomCell, for: indexPath) as! NoticeTableViewCell
            
            cell.title.text = notice.title
            cell.content.text = notice.content
            cell.notice_date.text = notice.notice_date
            
            return cell
        }
        
        
        
        
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) as? NoticeTitleTableViewCell else { return }
        guard let index = tableView.indexPath(for: cell) else { return }
        if index.row == indexPath.row {
            if index.row == 0 {
                
                if noticeList[indexPath.section].open == true { noticeList[indexPath.section].open = false
                    
                    let section = IndexSet.init(integer: indexPath.section)
                    
                    tableView.reloadSections(section, with: .fade)
                    
                }else {
                    noticeList[indexPath.section].open = true
                    
                    let section = IndexSet.init(integer: indexPath.section)
                    tableView.reloadSections(section, with: .fade)
                    
                }
                
                
                
            }
        }
    }

//    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        if section == 0 {
//            return NoticeHeader()
//        }
//        return nil
//    }
//
//    override func tableView(_ tableView: UITableView, estimatedHeightForHeaderInSection section: Int) -> CGFloat {
//        if section == 0 {
//            return 500
//        }
//        return 0
//    }
}
