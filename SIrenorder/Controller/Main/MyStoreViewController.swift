//
//  SecondViewController.swift
//  SIrenorder
//
//  Created by Dustin on 2020/08/21.
//  Copyright © 2020 Dustin. All rights reserved.
//

import UIKit
import Kingfisher

private let headerIdentifier = "HeaderView"
private let cellIdentifier = "Cell"

class MyStoreViewController: UICollectionViewController {
    
    // MARK: - Properties
    let networkModel = CallRequest()
    let networkURL = NetWorkURL()
    
    var myStoreList = [MyStoreModel]()
    
    let imageView: UIImageView = {
        let iv = UIImageView(image: UIImage(systemName: "bolt"))
        iv.contentMode = .scaleToFill
        return iv
    }()
    
    let textLabel: UILabel = {
        let text = UILabel()
//        text.text = "cafe" // 백엔드에서 받아오기
        text.textAlignment = .center
        return text
    }()
    
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        

        // Do any additional setup after loading the view.
    }
    
    // MARK: - Helper
    
    func configureUI() {
        
        title = "찜한 가게"
        
        let param = ["phone": "01093756927"]
        
        networkModel.get(method: .get, param: param, url: networkURL.myStoreList) { (json) in
            
            if json["result"].boolValue {
            
            for item in json["favorite"].array! {
                let storeModel = MyStoreModel(store_id: item["store_id"].intValue, store_info: item["store_info"].stringValue, store_latitude: item["store_latitude"].floatValue, store_longitude: item["store_longitude"].floatValue, store_name: item["store_name"].stringValue, store_location: item["store_location"].stringValue, store_image: item["store_image"].stringValue)
                self.myStoreList.append(storeModel)
            }
            
            self.collectionView.reloadData()
            

        }
        }
        
        collectionView.backgroundColor = .lightGray
        
        // register cell & header
        self.collectionView.register(MainShopCell.self, forCellWithReuseIdentifier: cellIdentifier)
        self.collectionView.register(MainShopHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerIdentifier)
        
    }
    
    
    // MARK: - UICollectionViewDataSoucre/Delegate
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerIdentifier, for: indexPath)
        
        return header
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return myStoreList.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! MainShopCell
        let store = myStoreList[indexPath.item]
        
        cell.titleLabel.text = store.store_name
        cell.imageView.kf.setImage(with: URL(string: store.store_image))
        cell.locationLabel.text = store.store_location
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let vc = DetailViewController()

        navigationController?.pushViewController(vc, animated: true)
    }

}

extension MainShopCollectionViewController: UICollectionViewDelegateFlowLayout {
    
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
