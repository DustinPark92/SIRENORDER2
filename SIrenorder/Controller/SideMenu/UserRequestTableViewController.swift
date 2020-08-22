//
//  UserRequestTableViewController.swift
//  SIrenorder
//
//  Created by Dustin on 2020/08/21.
//  Copyright © 2020 Dustin. All rights reserved.
//

import UIKit

class UserRequestTableViewController: UITableViewController {
  
    let customView = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
    let button = UIButton(frame: CGRect(x: 85, y: 0, width: 200, height: 50))
    let networkModel = CallRequest()
    let networkURL = NetWorkURL()
    var requestList = [RequestModel]()

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        let param = ["email":"sky_battle@naver.com "]
        //let param = ["email":"p4569zz@naver.com "]
        networkModel.get(method: .get
        , param: param, url: networkURL.requestList) { (json) in
            
            print("불리언\(json["result"].boolValue)")
            var requestModel = RequestModel()
            
           if json["result"].boolValue {
                
                for item in json["inquiry"].array! {
                    requestModel.title = item["title"].stringValue
                    requestModel.inquiry_id = item["inquiry_id"].intValue
                    
                    requestModel.inquiry_date = item["inquiry_date"].stringValue
                    
                    if item["is_replied"].stringValue == "N" {
                        requestModel.is_replied = "미 답변"
                    } else {
                        requestModel.is_replied = "답변 완료"
                    }
                    
           
                    self.requestList.append(requestModel)
                }
                
            }
            self.tableView.reloadData()
            
            
        }

        
        
    }
    
    
    func configureUI() {
        
        customView.backgroundColor = UIColor.red
        button.setTitle("작성하기", for: .normal)
        
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        customView.addSubview(button)
        tableView.register(UserRequestTableViewCell.self, forCellReuseIdentifier: "UserRequestTableViewCell")

        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return requestList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserRequestTableViewCell", for: indexPath) as! UserRequestTableViewCell
        
        let request = requestList[indexPath.row]
        cell.title.text = request.title
        cell.inquiry_date.text = request.inquiry_date
        cell.answerLabel.text = request.is_replied
     
                           
        return cell
    }
    
    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
       return customView
    }
    
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
       return 50
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = UserRequestDetailTableViewController()
        
        controller.inquiryNumber = requestList[indexPath.row].inquiry_id
        navigationController?.pushViewController(controller, animated: true)
        
        
    }
    

    @objc func buttonAction() {
        let controller = WriteViewController()
        navigationController?.pushViewController(controller, animated: true)
        
    }
}



    
    
    
