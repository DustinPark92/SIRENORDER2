//
//  DetailViewController.swift
//  SIrenorder
//
//  Created by Kang Mingu on 2020/08/21.
//  Copyright © 2020 Dustin. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    // MARK: - Properties
    
    let SlidingCellId = "slidingCell"
    let menuCellId = "menuCell"
    
    var name = ""
    var address: String?
    
    var idNum = 13
    var type = ""
    
    var storeId: Int = 0
    let networkModel = CallRequest()
    let networkURL = NetWorkURL()
    
    var categoryArray = [CategoryModel]()
    var menuArray = [StoreMenuModel]()
    var storeInfo = [StoreIntroductionModel]()
    
    var bookMarkIsTapped = true
    
    lazy var rightBarItem: UIBarButtonItem = {
        
        let item = UIBarButtonItem(image: UIImage(systemName: "bookmark"),
                                   style: .plain,
                                   target: self,
                                   action: #selector(handleBookmark))
        return item
    }()
    
    let DetailSlidingCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
//        layout.estimatedItemSize = CGSize(width: 10, height: 10)
        layout.minimumLineSpacing = 16
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .gray
        cv.isScrollEnabled = true
        return cv
    }()
    
    let infoView: UIView = {
        let view = UIView()
        //        view.backgroundColor = .yellow
        return view
    }()
    
    let titleLabel: UILabel = {
        let tl = UILabel()
        tl.font = .monospacedDigitSystemFont(ofSize: 32, weight: .heavy)
        return tl
    }()
    
    let addressLabel: UILabel = {
        let tl = UILabel()
        tl.font = .systemFont(ofSize: 18)
        tl.textColor = .darkGray
        tl.numberOfLines = 0
        return tl
    }()
    
    let infoButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("가게정보", for: .normal)
        button.addTarget(self, action: #selector(handleInfo), for: .touchUpInside)
        button.frame.size = CGSize(width: 60, height: 30)
        button.backgroundColor = .black
        button.layer.cornerRadius = 20
        button.tintColor = .white
        return button
    }()
    
    let table: UITableView = {
        let tv = UITableView()
        tv.backgroundColor = .clear
        tv.tableFooterView = UIView()
        return tv
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        
        let param = ["store_id": storeId]
        
        networkModel.get(method: .get, param: param, url: networkURL.categoryURL) { (json) in
            
            var category = CategoryModel()
            
            if json["result"].boolValue {
                
                for item in json["category"].array! {
                    
                    category.category_id = item["category_id"].intValue
                    category.category_name = item["category_name"].stringValue
                    category.store_id = item["store_id"].intValue
                    self.categoryArray.append(category)
                }
                
                self.DetailSlidingCollectionView.reloadData()
            }
        }
        
        let param2 = ["store_id": storeId, "category_id": "1"] as [String : Any]
        
        networkModel.get(method: .get, param: param2, url:networkURL.menuByCate) { (json) in
            
            var menu = StoreMenuModel()
            
            if json["result"].boolValue {
                for item in json["menu"].array! {
                    
                    menu.category_id = item["category_id"].intValue
                    menu.menu_defaultprice = item["menu_defaultprice"].intValue
                    menu.menu_id = item["menu_id"].intValue
                    menu.menu_info = item["menu_info"].stringValue
                    menu.menu_name = item["menu_name"].stringValue
                    menu.store_id = item["store_id"].intValue
                    
                    self.menuArray.append(menu)
                }
                self.table.reloadData()
            }
        }
    }
    
    // MARK: - Selector
    
    @objc func handleBookmark(sender: UIBarButtonItem) {
        
        if bookMarkIsTapped == false {
            bookMarkIsTapped = true
            rightBarItem.image = UIImage(systemName: "bookmark.fill")
        } else if bookMarkIsTapped {
            bookMarkIsTapped = false
            rightBarItem.image = UIImage(systemName: "bookmark")
        }
    }
    
    @objc func handleInfo() {
        
        let vc = StoreInfoViewController()
        vc.storeId = storeId
        vc.storeName = name
        navigationController?.pushViewController(vc, animated: true)
    }
    
    // MARK: - Helper
    
    func configureUI() {
        view.backgroundColor = .white
        
        DetailSlidingCollectionView.delegate = self
        DetailSlidingCollectionView.dataSource = self
        
        table.delegate = self
        table.dataSource = self
        
        navigationItem.title = name
        
        navigationItem.rightBarButtonItem = rightBarItem
        
        //add infoview
        view.addSubview(infoView)
        infoView.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, right: view.rightAnchor, height: 120)
        
        //add store title
        view.addSubview(titleLabel)
        titleLabel.anchor(top: infoView.safeAreaLayoutGuide.topAnchor, left: infoView.safeAreaLayoutGuide.leftAnchor, paddingTop: 8, paddingLeft: 20)
        titleLabel.text = name
        
        //add address title
        view.addSubview(addressLabel)
        addressLabel.anchor(top: titleLabel.bottomAnchor, left: view.safeAreaLayoutGuide.leftAnchor, paddingTop: 4, paddingLeft: 20)
        addressLabel.text = address
        
        //add info button
        view.addSubview(infoButton)
        infoButton.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: addressLabel.rightAnchor, right: view.safeAreaLayoutGuide.rightAnchor, paddingTop: 20, paddingLeft: 20, paddingRight: 10, width: 100, height: 80)
        
        //add sliding collectionview
        view.addSubview(DetailSlidingCollectionView)
        // register collectionView cell
        DetailSlidingCollectionView.register(DetailSlidingCell.self, forCellWithReuseIdentifier: SlidingCellId)
        DetailSlidingCollectionView.anchor(top: infoView.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, height: 50)
        DetailSlidingCollectionView.showsHorizontalScrollIndicator = false
        
        //add menu tableView
        view.addSubview(table)
        table.anchor(top: DetailSlidingCollectionView.bottomAnchor, left: view.leftAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.rightAnchor)
        // register tableView cell
        table.register(MenuCell.self, forCellReuseIdentifier: menuCellId)
    }
    
}

extension DetailViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return categoryArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SlidingCellId, for: indexPath) as! DetailSlidingCell
        
        cell.backgroundColor = indexPath.item % 2 == 0 ? .red : .orange
        cell.titleLabel.text = categoryArray[indexPath.item].category_name
        cell.titleLabel.font = .systemFont(ofSize: 16)
        cell.titleLabel.textAlignment = .center
        cell.layer.cornerRadius = cell.frame.width / 3
        
        
        
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {

        return UIEdgeInsets(top: 0, left: 4, bottom: 0, right: 4)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let size = CGSize(width: 200, height: collectionView.frame.size.height - 8)
        let attributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16)]
        
        let estimatedFrame = NSString(string: categoryArray[indexPath.item].category_name).boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: attributes, context: nil)
        
        return CGSize(width: estimatedFrame.width + 30, height: collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        self.menuArray = []
        
        idNum = categoryArray[indexPath.item].category_id
        
        let param2 = ["store_id": "\(storeId)", "category_id": "\(idNum)"]
        
        networkModel.get(method: .get, param: param2, url:networkURL.menuByCate) { json in
            
            var menu = StoreMenuModel()
            
            if json["result"].boolValue {
                for item in json["menu"].array! {
                    
                    menu.category_id = item["category_id"].intValue
                    menu.menu_defaultprice = item["menu_defaultprice"].intValue
                    menu.menu_id = item["menu_id"].intValue
                    menu.menu_info = item["menu_info"].stringValue
                    menu.menu_name = item["menu_name"].stringValue
                    menu.store_id = item["store_id"].intValue
                    
                    self.menuArray.append(menu)
                }
                self.table.reloadData()
            }
        }
    }
    
}

// MARK: - TableviewDataSource/Delegate

extension DetailViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: menuCellId) as! MenuCell
        cell.textLabel?.text = menuArray[indexPath.row].menu_name
        cell.textLabel?.font = .systemFont(ofSize: 20, weight: .light)
        cell.priceLabel.text = "\(menuArray[indexPath.row].menu_defaultprice) 원"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        print("item selected")
    }
    
}
