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
private let changedIdentifer = ""


class MypageViewController: UITableViewController {

        let networkModel = CallRequest()
        let networkURL = NetWorkURL()
        var headerView = MypageHeaderView()
        var noticeList = [NoticeModel]()
        
        override func viewDidLoad() {
            super.viewDidLoad()
            configureUI()
            
            title = "마이페이지"


            networkModel.get(method: .get, url: networkURL.noticeURL) { (json) in
                if json["result"].boolValue {
                    
                    }
                    
                    print(self.noticeList)
                    self.tableView.reloadData()
                    
                    
                }
            }
    
    func configureUI() {
        
              
              tableView.register(MypageTableViewCell.self, forCellReuseIdentifier: reuseIdentifier)
        
              tableView.tableHeaderView = headerView
              headerView.setDimensions(width: view.frame.width, height: 300)
              headerView.collectionView.delegate = self
              headerView.collectionView.dataSource = self
        headerView.collectionView.register(MypageExtraCollectionViewCell.self, forCellWithReuseIdentifier: CVIdentifier)
    }
            
        
        // MARK: - Table view data source
        
   
        override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return 6
            
        }
        
//        override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//
//        }
        
        override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! MypageTableViewCell
            
            return cell

        }
    
    
//
//        override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        }

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
