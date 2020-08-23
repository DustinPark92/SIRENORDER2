//
//  OrderDetailTableViewController.swift
//  SIrenorder
//
//  Created by Dustin on 2020/08/23.
//  Copyright © 2020 Dustin. All rights reserved.
//

import UIKit

private let reuseIdentifier = "OrderDetailTableViewCell"

class OrderDetailTableViewController: UIViewController {
    

    let centerView : UIView = {
        let uv = UIView()
        return uv
    }()
    
    let topView : UIView = {
        let uv = UIView()
        uv.backgroundColor = .white
        return uv
    }()
    
    let cafeNameLabel : UILabel = {
        let lb = UILabel()
        lb.text = "test cafe"
        return lb
    }()
    
    let closeButton : UIButton = {
        let bt = UIButton()
        bt.backgroundColor = .black
        bt.setTitle("close", for: .normal)
        bt.addTarget(self, action: #selector(handleClose), for: .touchUpInside)
       return bt
    }()
    
    let bottomView : UIView = {
        let uv = UIView()
        uv.backgroundColor = .black
        return uv
    }()
    
    let totalLabel : UILabel = {
        let lb = UILabel()
        lb.textColor = .white
        lb.font = UIFont.systemFont(ofSize: 20)
        lb.text = "Totals : 4300"
        return lb
    }()
    
    
    let tableView : UITableView = {
        let tv = UITableView()
        return tv
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureUI()
    }

    func configureUI() {
        view.addSubview(centerView)
        centerView.addSubview(topView)
        centerView.addSubview(tableView)
        centerView.addSubview(bottomView)
        
        topView.anchor(top:centerView.topAnchor,left:centerView.leftAnchor,right: centerView.rightAnchor,height: 100)
        tableView.anchor(top:topView.bottomAnchor,left: centerView.leftAnchor,right: centerView.rightAnchor)
        
        bottomView.anchor(top:tableView.bottomAnchor,left: centerView.leftAnchor,bottom:centerView.bottomAnchor,right: centerView.rightAnchor,height: 50)

        
        centerView.center(inView: view)
        centerView.setDimensions(width: view.frame.width / 1.5, height: view.frame.height / 2.5)
        topView.addSubview(cafeNameLabel)
        topView.addSubview(closeButton)
        
        cafeNameLabel.anchor(top:topView.topAnchor,left: topView.leftAnchor,bottom: topView.bottomAnchor,paddingTop: 30,paddingLeft: 15,paddingBottom: 15)
        
        closeButton.anchor(top:topView.topAnchor,right:topView.rightAnchor,paddingTop: 5,paddingRight: 5,width: 24,height: 24)
        
        
        bottomView.addSubview(totalLabel)
        totalLabel.anchor(top:bottomView.topAnchor,right: bottomView.rightAnchor)
        
        tableView.register(OrderDetailTableViewCell.self, forCellReuseIdentifier: reuseIdentifier)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 200
   
    }
    
    @objc func handleClose() {
        self.dismiss(animated: true, completion: nil)
        
    }


}

extension OrderDetailTableViewController : UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! OrderDetailTableViewCell
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.estimatedRowHeight
    }
    
    
    
    
    
    
    
}
