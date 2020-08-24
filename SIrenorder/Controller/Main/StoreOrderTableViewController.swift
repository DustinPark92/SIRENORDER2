//
//  StoreOrderTableViewController.swift
//  SIrenorder
//
//  Created by Kang Mingu on 2020/08/23.
//  Copyright © 2020 Dustin. All rights reserved.
//

import UIKit

private let mandatoryId = "cell1"
private let personalId = "cell2"

class StoreOrderViewController: UIViewController {
    
    // MARK: - Properties
    
    var storeName = ""
    var menuName = ""
    var typeName = ""
    var price = ""
    var menuId = 0
    
    var extraModel = [ExtraModel]()
    
    let networkModel = CallRequest()
    let networkURL = NetWorkURL()
    
    let topView = UIView()
    
    let tableView = UITableView()
    let tableHeader = UIView(frame: .zero)
    let customView = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
    let bottomView = UIView(frame: .zero)
    let cartButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("장바구니에 담기", for: .normal)
        button.setImage(UIImage(systemName: "cart"), for: .normal)
        button.tintColor = .black
        button.addTarget(self, action: #selector(handleCart), for: .touchUpInside)
        return button
    }()
    let typeNameLabel = UILabel()
    var priceLabel = UILabel()
    let minusButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "minus.rectangle"), for: .normal)
        button.imageView?.contentMode = .scaleToFill
        button.addTarget(self, action: #selector(handleMinusButton), for: .touchUpInside)
        return button
    }()
    let plusButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "plus.rectangle"), for: .normal)
        button.imageView?.contentMode = .scaleToFill
        button.addTarget(self, action: #selector(handlePlusButton), for: .touchUpInside)
        return button
    }()
    var num = 1
    
    var quantityLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        return label
    }()

    
    // MARK: - Lifecycle
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        tabBarController?.tabBar.isHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        
        let param = ["menu_id": menuId]
        
        networkModel.get(method: .get, param: param, url: networkURL.extra) { json in
            
            var extra = ExtraModel()
            
            if json["result"].boolValue {
                
                for item in json["extra"].array! {
                    
                    extra.extra_group = item["extra_group"].stringValue
                    extra.extra_name = item["extra_name"].stringValue
                    extra.extra_id = item["extra_id"].intValue
                    extra.extra_maxcount = item["extra_maxcount"].intValue
                    self.extraModel.append(extra)
                }
                self.tableView.reloadData()
            }
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        
        tabBarController?.tabBar.isHidden = false
    }
    
    // MARK: - Selector
    
    @objc func handleCart() {
        
        print("handle add cart")
    }
    
    @objc func handlePlusButton() {
        
        if num < 50 {
            num += 1
            quantityLabel.text = "\(num)"
            priceLabel.text = "₩ \(Int(price)! * num)"
        }
        
    }
    
    @objc func handleMinusButton() {
        if num > 1 {
            num -= 1
            quantityLabel.text = "\(num)"
            priceLabel.text = "₩ \(Int(price)! * num)"
        }
    }
    
    @objc func handleIce(sender : UIButton) {
        
        sender.isSelected = !sender.isSelected
        if sender.isSelected {
            sender.backgroundColor = .gray
        } else {
            sender.backgroundColor = .black
        }
        
    }
    @objc func handleHot(sender : UIButton) {
        
        sender.isSelected = !sender.isSelected
        if sender.isSelected {
            sender.backgroundColor = .gray
        } else {
            sender.backgroundColor = .black
        }
    }
    
    // MARK: - Helper
    
    func configureUI() {
        
        title = typeName
        view.backgroundColor = .white
        
        // MARK: - header view
        view.addSubview(topView)
        topView.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor,
                       right: view.rightAnchor, height: 120)
        
        topView.addSubview(typeNameLabel)
        typeNameLabel.anchor(top: topView.topAnchor, paddingTop: 20)
        typeNameLabel.centerXAnchor.constraint(equalTo: topView.centerXAnchor).isActive = true
        typeNameLabel.text = menuName
        typeNameLabel.font = .boldSystemFont(ofSize: 32)
        
        topView.addSubview(priceLabel)
        priceLabel.anchor(top: typeNameLabel.bottomAnchor, left: view.leftAnchor,
                          paddingTop: 20, paddingLeft: 40)
        priceLabel.text = "₩ \(Int(price)! * num)"
        priceLabel.font = .systemFont(ofSize: 24)
        
        let stackView = UIStackView(arrangedSubviews: [minusButton, quantityLabel, plusButton])
        topView.addSubview(stackView)
        stackView.anchor(top: typeNameLabel.bottomAnchor, right: topView.rightAnchor,
                         paddingTop: 16, paddingRight: 40, width: 100, height: 40)
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 4
        quantityLabel.text = "\(num)"
        quantityLabel.font = .systemFont(ofSize: 24)
        quantityLabel.widthAnchor.constraint(equalToConstant: 30).isActive = true
        
        
       // tableView
        view.addSubview(tableView)
        tableView.anchor(top: topView.bottomAnchor,
                         left: view.leftAnchor,
                         bottom: view.safeAreaLayoutGuide.bottomAnchor,
                         right: view.rightAnchor)
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(MandatoryOptionCell.self, forCellReuseIdentifier: mandatoryId)
        tableView.register(PersonalOptionCell.self, forCellReuseIdentifier: personalId)
        
        
        // custom view
//        cell에서 설정해주기
        
        
        // footer view
        bottomView.backgroundColor = .orange
        
        bottomView.addSubview(cartButton)
        cartButton.anchor(top:bottomView.topAnchor, left: bottomView.leftAnchor,
                          bottom: bottomView.bottomAnchor, right: bottomView.rightAnchor)
        
    }


}


extension StoreOrderViewController: UITableViewDataSource, UITableViewDelegate {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 0 {
            return 1
        } else {
            return 2
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        //Cell 안의 customView configuration
        
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: mandatoryId, for: indexPath) as! MandatoryOptionCell
            
            cell.iceButton.addTarget(self, action: #selector(handleIce(sender:)), for: .touchUpInside)
            cell.hotButton.addTarget(self, action: #selector(handleHot(sender:)), for: .touchUpInside)
            
            if cell.iceButton.isSelected {
                cell.hotButton.backgroundColor = .black
            }
            return cell
            
            
            
            
            
            
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: personalId, for: indexPath) as! PersonalOptionCell
            
            return cell
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 2
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

        if indexPath.section == 0 {
            return 300
        } else {
            return 60
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        if section == 0 {
            return "필수 옵션"
        }
        return "퍼스널 옵션"
    }
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        tableView.deselectRow(at: indexPath, animated: true)
//    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        
        return bottomView
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        
        if section == 1 {
            return 60
        } else {
            return 0
        }
    }
    
    
}
