//
//  FifthViewController.swift
//  SIrenorder
//
//  Created by Dustin on 2020/08/21.
//  Copyright © 2020 Dustin. All rights reserved.
//

import UIKit


private let reuseIdentifier = "MypageTableViewCell"
private let CVIdentifier = "MypageExtraCollectionViewCell"
private let changedIdentifer = "MypageEditTableViewCell"



class MypageViewController: UITableViewController {
    var myPageModel = MypageTableViewModel()
    let networkModel = CallRequest()
    let networkURL = NetWorkURL()
    var headerView = MypageHeaderView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        
        title = "마이페이지"
        
        
        networkModel.get(method: .get, url: networkURL.noticeURL) { (json) in
            if json["result"].boolValue {
                
            }
            
            self.tableView.reloadData()
            
            
        }
    }
    
    func configureUI() {
        tableView.backgroundColor = .systemGroupedBackground
        tableView.backgroundColor = .white
        tableView.register(MypageTableViewCell.self, forCellReuseIdentifier: reuseIdentifier)
        tableView.register(MypageEditTableViewCell.self, forCellReuseIdentifier: changedIdentifer)
        
        tableView.tableHeaderView = headerView
        headerView.setDimensions(width: view.frame.width, height: 300)
        headerView.collectionView.delegate = self
        headerView.collectionView.dataSource = self
        headerView.collectionView.register(MypageExtraCollectionViewCell.self, forCellWithReuseIdentifier: CVIdentifier)
        
    }
    
    
    // MARK: - Table view data source
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return myPageModel.mainTableCell.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            if myPageModel.open {
                return 3
            }
            return 1
        }else{
            return 1
            
        }
        
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        
        if indexPath.row == 0 {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! MypageTableViewCell
            cell.titleLabel.text = myPageModel.mainTableCell[indexPath.section]
            
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: changedIdentifer, for: indexPath) as! MypageEditTableViewCell
            
            cell.titleLabel.text = myPageModel.subTableCell[indexPath.row - 1]
            return cell
        }
        
        
        
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
            print("로우는 \(indexPath.row)")
           print("섹션은 \(indexPath.section)")
        

        if indexPath.section == 0 {
            if myPageModel.open == true {
                if indexPath.row == 1 {
                    let controller = MypagePasswordChangeViewController()
                    navigationController?.pushViewController(controller, animated: true)
                } else {
                myPageModel.open = false

                let section = IndexSet.init(integer: indexPath.section)
                tableView.reloadSections(section, with: .fade)
                }

            }else {

                myPageModel.open = true
                
                let section = IndexSet.init(integer: indexPath.section)
                tableView.reloadSections(section, with: .fade)
                
            }
        } else if indexPath.section == 1 {
            let layout = UICollectionViewFlowLayout()
            let controller = CouponCollectionViewController(collectionViewLayout: layout)
            navigationController?.pushViewController(controller, animated: true)
        } else if indexPath.section == 2{
            let controller = NoticeTableViewController()
            navigationController?.pushViewController(controller, animated: true)
        } else if indexPath.section == 3 {
            showMailView()
            
        } else if indexPath.section == 4 {
        let controller = UserRequestTableViewController()
        navigationController?.pushViewController(controller, animated: true)
    }
}
}



extension MypageViewController : UICollectionViewDelegate,UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CVIdentifier, for: indexPath) as! MypageExtraCollectionViewCell
        
        
        return cell
    }
    
    
    
    
    
    
}

