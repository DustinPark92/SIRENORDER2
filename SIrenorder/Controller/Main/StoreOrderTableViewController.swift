//
//  StoreOrderTableViewController.swift
//  SIrenorder
//
//  Created by Kang Mingu on 2020/08/23.
//  Copyright © 2020 Dustin. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

private let cellId = "cell"
private let personalCell = "PersonalOptionCell"
private let personalPriceCell = "PersonalOptionPriceCell"
private let collectionCell = "cell2"
private let headerId = "header"

class StoreOrderViewController: UIViewController {
    
    // MARK: - Properties
    
    var extraGroupSet = Set<String>()
    
    var storeName = ""
    var menuName = ""
    var typeName = ""
    var price = 0
    var menuId = 0
    var extra = 0
    var selectIndex = 0
    
    var extraModel = ExtraModel()
    let networkModel = CallRequest()
    let networkURL = NetWorkURL()
    
    var extraNameArray = [String]()
    var dict = [String: Array<String>]()
    var moneyDict = [String: Int]()
    var extraGroupArr = [String]()
    var arr = [String]()
    var nullGroupName = [String]()
    var nullGroupPrice = [Int]()
    var nullGroupDic = [String:Int]()
    var sortedArr = [String]()
    var moneyArr = [Int]()
    
    let topView = UIView()
    
    let tableView = UITableView()
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
        
        title = typeName
        
        configureUI()
        callRequest()
        
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
            priceLabel.text = "₩ \((price + extra) * num)"
        }
        
    }
    
    @objc func handleMinusButton() {
        if num > 1 {
            num -= 1
            quantityLabel.text = "\(num)"
            priceLabel.text = "₩ \((price + extra) * num)"
        }
    }
    
    
    // MARK: - Helper
    
    func callRequest() {
        
        let param = ["menu_id":"\(menuId)"]
        
        AF.request("http://54.180.56.44:8080/ExtraFindByMenuId.do", method: .get, parameters: param
        ).validate().responseJSON { response in
            
            
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                var extra = ExtraModel()
                
                if json["result"].boolValue {
                    for i in 1...json["extra"].array!.count{
                        
                        if json["extra"][i]["extra_group"].stringValue == json["extra"][i-1]["extra_group"].stringValue {
                            if !self.arr.contains(json["extra"][i-1]["extra_name"].stringValue) {
                                self.arr.append(json["extra"][i-1]["extra_name"].stringValue)
                            }
                            
                            self.arr.append(json["extra"][i]["extra_name"].stringValue)
                            
                            let sortedArr = self.arr.sorted(by: { $0 > $1 })
                            self.dict.removeValue(forKey: json["extra"][i-1]["extra_group"].stringValue)
                            self.dict.updateValue(sortedArr, forKey: json["extra"][i]["extra_group"].stringValue)
                            
                            
                            
                        } else {
                            self.arr.removeAll()
                        }
                        
                    }
                    
                    
                    for item in json["extra"].array! {
                        
                        if item["extra_group"].stringValue != "null" {
                            self.extraGroupSet.insert(item["extra_group"].stringValue)
                            
                            self.moneyDict.updateValue(item["extra_price"].intValue, forKey: item["extra_name"].stringValue)
                            
                            
                        } else {
                            
                            self.nullGroupName.append(item["extra_name"].stringValue)
                            self.nullGroupPrice.append(item["extra_price"].intValue)
                            self.nullGroupDic.updateValue(item["extra_price"].intValue, forKey: item["extra_name"].stringValue)
                            
                            
                            
                        }
                        
                    }
                }
            case .failure(let error):
                
                print(error.errorDescription)
                
                
                
            }
            
            
            self.extraGroupArr.append(contentsOf: self.extraGroupSet)
            self.sortedArr = self.extraGroupArr.sorted(by: { $0.count > $1.count })
            
            
            self.tableView.reloadData()
            
            print("딕셔너리는 \(self.dict)")
            print("가격은 \(self.moneyDict)")
            
            
        }
        
    }
    
    func configureUI() {
        
        title = typeName
        view.backgroundColor = .white
        
        // MARK: - header view
        view.addSubview(topView)
        topView.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor,
                       right: view.rightAnchor, height: 120)
        
        topView.addSubview(typeNameLabel)
        typeNameLabel.anchor(top: topView.topAnchor, paddingTop: 12)
        typeNameLabel.centerXAnchor.constraint(equalTo: topView.centerXAnchor).isActive = true
        typeNameLabel.text = menuName
        typeNameLabel.font = .systemFont(ofSize: 24)
        
        topView.addSubview(priceLabel)
        priceLabel.anchor(top: typeNameLabel.bottomAnchor, left: view.leftAnchor,
                          paddingTop: 20, paddingLeft: 40)
        priceLabel.text = "₩ \(price * num)"
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
                         right: view.rightAnchor)
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(MandatoryOptionCell.self, forCellReuseIdentifier: cellId)
        tableView.register(PersonalOptionCell.self, forCellReuseIdentifier: personalCell)
        
        tableView.register(PersonalOptionPriceCell.self, forCellReuseIdentifier: personalPriceCell)
        
        
        // footerView 없애고, cartButton에 백그라운드 색상 입히기.
        
        view.addSubview(cartButton)
        cartButton.anchor(top: tableView.bottomAnchor,
                          left: view.leftAnchor,
                          bottom: view.safeAreaLayoutGuide.bottomAnchor,
                          right: view.rightAnchor,
                          paddingTop: 0,
                          height: 60)
        cartButton.backgroundColor = .orange
        
        
    }
    
    
}


extension StoreOrderViewController: UITableViewDataSource, UITableViewDelegate {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 1 {
            if extraModel.open {
                return nullGroupName.count + 1
            } else {
                return nullGroupName.count
            }
        }
        
        return extraGroupArr.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        if indexPath.section == 1 {
            if extraModel.open {
                if indexPath.row == selectIndex + 1 {
                    let cell = tableView.dequeueReusableCell(withIdentifier: personalPriceCell, for: indexPath) as! PersonalOptionPriceCell
                    cell.backgroundColor = .red
                    return cell
                } else {
                    let cell = tableView.dequeueReusableCell(withIdentifier: personalCell, for: indexPath) as! PersonalOptionCell
                    nullGroupName.insert("", at: selectIndex + 1)
                    nullGroupPrice.insert(0, at: selectIndex + 1)
                    cell.nameLabel.text = nullGroupName[indexPath.row]
                    cell.moneyLabel.text = "+    \(nullGroupPrice[indexPath.row])"
                    
                    cell.backgroundColor = .lightGray
                    nullGroupName.remove(at: selectIndex + 1)
                    nullGroupPrice.remove(at: selectIndex + 1)
                    
                    return cell
                    
                }
                
                
            }
            
            
            let cell = tableView.dequeueReusableCell(withIdentifier: personalCell, for: indexPath) as! PersonalOptionCell
            
            cell.backgroundColor = .lightGray
            cell.nameLabel.text = nullGroupName[indexPath.row]
            cell.moneyLabel.text = "+    \(nullGroupPrice[indexPath.row])"
            
            return cell
        }
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! MandatoryOptionCell
        cell.collectionView.delegate = self
        cell.collectionView.dataSource = self
        cell.collectionView.register(MandatoryCollectionViewCell.self, forCellWithReuseIdentifier: collectionCell)
        
        cell.collectionView.register(StoreOrderCollectionViewHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerId)
        
        cell.collectionView.tag = indexPath.row
        
        
        
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 2
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 1 {
            
            return 50
            
        }
        
        return 150
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.estimatedRowHeight
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        if section == 0 {
            return "필수 옵션"
        }
        return "퍼스널 옵션"
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 1 {
            if extraModel.open == true {
                extraModel.open = false

                
                print(selectIndex)
                let section = IndexSet.init(integer: indexPath.section)
                tableView.reloadSections(section, with: .fade)
            }else {
                selectIndex = indexPath.row

                

                print("\(nullGroupName)")
                extraModel.open = true
                let section = IndexSet.init(integer: indexPath.section)
                tableView.reloadSections(section, with: .fade)
                
            }
            
            
            
        }
    }
    
    //    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
    //
    //    }
}



extension StoreOrderViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        
        for i in 0...collectionView.tag {
            if collectionView.tag == i {
                return dict[sortedArr[i]]!.count
            }
        }
        
        return 0
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: collectionCell, for: indexPath) as! MandatoryCollectionViewCell
        
        
        for i in 0...collectionView.tag {
            cell.nameLabel.text = dict[sortedArr[i]]![indexPath.item]
            
        }
        
        print(123)
        
        return cell
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        for i in 0...collectionView.tag {
            if collectionView.tag == i {
                let totalCellWidth = 100 * dict[sortedArr[i]]!.count
                let totalSpacingWidth = 20 * (dict[sortedArr[i]]!.count - 1)
                
                let leftInset = (collectionView.frame.width - CGFloat(totalCellWidth + totalSpacingWidth)) / 2
                let rightInset = leftInset
                
                return UIEdgeInsets(top: 0, left: leftInset, bottom: 0, right: rightInset)
            }
        }
        
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        
        return CGSize(width: collectionView.frame.width, height: 30)
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerId, for: indexPath) as! StoreOrderCollectionViewHeader
        
        let sortedArr = extraGroupArr.sorted(by: { $0.count > $1.count })
        header.label.text = sortedArr[collectionView.tag]
        
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        for i in 0...collectionView.tag {
            
            extra = moneyDict[dict[sortedArr[i]]![indexPath.item]] ?? 0
            priceLabel.text = "₩ \((price + extra) * num)"
            
        }
    }
    
}
