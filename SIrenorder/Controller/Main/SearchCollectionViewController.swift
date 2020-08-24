//
//  SearchCollectionViewController.swift
//  SIrenorder
//
//  Created by Dustin on 2020/08/24.
//  Copyright © 2020 Dustin. All rights reserved.
//

import UIKit

private let headerIdentifier = "HeaderView"
private let cellIdentifier = "Cell"

class SearchCollectionViewController: UICollectionViewController {
    
    var searchResult = "검색 결과"
    let networkModel = CallRequest()
    let networkURL = NetWorkURL()
    var searchList = [SearchModel]()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()

    }


    func configureUI() {
        
        self.collectionView.register(MainShopCell.self, forCellWithReuseIdentifier: cellIdentifier)
        self.collectionView.register(MainShopHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerIdentifier)
        
        let param = ["keyword":searchResult]
        
        networkModel.get(method: .get, param: param, url: networkURL.searchList) { json in
            
            if json["result"].boolValue {
                
                for item in json["store"].array! {
                    let searchModel = SearchModel(store_id: item["store_id"].intValue, store_opentime: item["store_opentime"].stringValue, store_phone: item["store_phone"].stringValue, store_info: item["store_info"].stringValue, store_latitude: item["store_latitude"].floatValue, store_longitude: item["store_longitude"].floatValue, store_closetime: item["store_closetime"].stringValue, store_daysoff: item["store_daysoff"].stringValue, store_name: item["store_name"].stringValue, store_location: item["store_location"].stringValue, type_code: item["type_code"].stringValue)
                    
                    self.searchList.append(searchModel)
                          
                }
                
                self.collectionView.reloadData()
            }
        }
    }

    // MARK: UICollectionViewDataSource



        // MARK: - UICollectionViewDataSoucre/Delegate
        
        override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
            
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerIdentifier, for: indexPath)
            
            return header
        }

        override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            
            return searchList.count
        }

        override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! MainShopCell
            
            cell.backgroundColor = .white
            cell.layer.cornerRadius = 18
            cell.titleLabel.font = .boldSystemFont(ofSize: 18)
            cell.titleLabel.text = searchList[indexPath.item].store_name
            cell.locationLabel.font = .systemFont(ofSize: 16)
            cell.locationLabel.text = searchList[indexPath.item].store_location
        
            return cell
        }
        
        override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    
        }

    }

    extension SearchCollectionViewController: UICollectionViewDelegateFlowLayout {
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
            return CGSize(width: view.frame.size.width, height: 70)
        }
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            return CGSize(width: view.frame.width * 0.9, height: 100)
        }
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
            return UIEdgeInsets(top: 10, left:0, bottom: 10, right:0)
        }
}
