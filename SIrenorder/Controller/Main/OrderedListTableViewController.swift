//
//  FourthViewController.swift
//  SIrenorder
//
//  Created by Dustin on 2020/08/21.
//  Copyright © 2020 Dustin. All rights reserved.
//

import UIKit

class OrderedListTableViewController: UITableViewController {
    
    
    let networkModel = CallRequest()
    let networkURL = NetWorkURL()
    var orderList = [OrderListModel]()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        let param = ["phone":"01093756927"]
   
        networkModel.get(method: .get
        , param: param, url: networkURL.requestList) { (json) in
            
            print("불리언\(json["result"].boolValue)")
            var orderModel = OrderListModel()
            
            if json["result"].boolValue {
                
                for item in json["order"].array! {
                    orderModel.order_date = item["order_date"].stringValue
                    orderModel.receipt_id = item["receipt_id"].stringValue
                    orderModel.store_name = item["store_name"].stringValue
                    orderModel.total_price = item["total_price"].intValue
             
                    
                    
                    self.orderList.append(orderModel)
                }
                
            }
            self.tableView.reloadData()
            
            
        }
        
        
        
    }
    
    
    func configureUI() {
 
        tableView.register(UserRequestTableViewCell.self, forCellReuseIdentifier: "UserRequestTableViewCell")
        
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserRequestTableViewCell", for: indexPath) as! UserRequestTableViewCell
    
        
        return cell
    }
    

}
