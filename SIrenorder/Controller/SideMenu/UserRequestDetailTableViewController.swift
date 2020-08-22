//
//  NoticeDatailTableViewController.swift
//  SIrenorder
//
//  Created by Dustin on 2020/08/22.
//  Copyright © 2020 Dustin. All rights reserved.
//

import UIKit

private let reuesIdentifier = "UserRequestDetailTableViewCell"

class UserRequestDetailTableViewController: UITableViewController {
    
    let networkModel = CallRequest()
    let networkURL = NetWorkURL()
    var requestList = [RequestModel]()
    var inquiryNumber = 0
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        tableView.rowHeight = 500


    }
    
    
    func configureUI() {
        
        
        tableView.register(UserRequestDetailTableViewCell.self, forCellReuseIdentifier: reuesIdentifier)
        
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuesIdentifier, for: indexPath) as! UserRequestDetailTableViewCell
       
        let param = ["inquiry_id":"\(inquiryNumber)"]
        
        networkModel.get(method: .get
        , param: param, url: networkURL.requestDetail) { (json) in
            
            self.title = json["title"].stringValue
            cell.content.text = json["content"].stringValue
            cell.notice_date.text = json["inquiry_date"].stringValue
            
            if json["is_replied"].stringValue == "N" {
                cell.anwerLabel.text = "답변이 미 완료된 질문입니다."
            } else {
                 cell.anwerLabel.text = "답변이 완료된 질문입니다."
            }
            
            
        }
        
        
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.estimatedRowHeight
    }
    
    
    
}
