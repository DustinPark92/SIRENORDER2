//
//  ShoppingCartTableViewController.swift
//  SIrenorder
//
//  Created by Dustin on 2020/08/24.
//  Copyright © 2020 Dustin. All rights reserved.
//

import UIKit

private let reuseIdentifier = "ShoppingCartTableViewCell"

class ShoppingCartTableViewController: UITableViewController {
    
    let sendButton: UIButton = {
        let bt = UIButton()
        bt.setTitle("보내기", for: .normal)
        bt.backgroundColor = .red
        bt.addTarget(self, action: #selector(handleButton), for: .touchUpInside)
        return bt
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
    }
    
    
    func configureUI() {
        view.addSubview(sendButton)
        sendButton.anchor(left: view.leftAnchor,bottom: view.safeAreaLayoutGuide.bottomAnchor,right: view.rightAnchor,width: view.frame.width,height: 50)
        tableView.rowHeight = 150
        title = "장바구니"
        tableView.register(ShoppingCartTableViewCell.self, forCellReuseIdentifier: reuseIdentifier)
        
    }
    
    @objc func handleButton() {
        
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! ShoppingCartTableViewCell
        
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.estimatedRowHeight
    }

    
    
    
    
    
    
}
