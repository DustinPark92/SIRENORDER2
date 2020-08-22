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
    
    var name: String?
    var address: String?
    
    let networkModel = CallRequest()
    let networkURL = NetWorkURL()
    
    lazy var rightBarItem: UIBarButtonItem = {
        
        let item = UIBarButtonItem(image: UIImage(systemName:  "bookmark"),
                                   style: .plain,
                                   target: self,
                                   action: #selector(handleBookmark))
        return item
    }()
    
    let DetailSlidingCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 16
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .gray
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
        return tv
    }()
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        
                
    }
    
    // MARK: - Selector
    
    @objc func handleBookmark(sender: UIBarButtonItem) {
        
        print("handle bookmark filling")
    }
    
    @objc func handleInfo() {
        
        print("handle info")
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
        DetailSlidingCollectionView.register(DetailSlidingCell.self, forCellWithReuseIdentifier: SlidingCellId)
        DetailSlidingCollectionView.anchor(top: infoView.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, height: 50)
        DetailSlidingCollectionView.showsHorizontalScrollIndicator = false
        
        //add menu tableView
        view.addSubview(table)
        table.anchor(top: DetailSlidingCollectionView.bottomAnchor, left: view.leftAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.rightAnchor)
        table.register(MenuCell.self, forCellReuseIdentifier: menuCellId)
    }

}

extension DetailViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SlidingCellId, for: indexPath) as! DetailSlidingCell
        
        cell.layer.cornerRadius = 20
        cell.backgroundColor = indexPath.item % 2 == 0 ? .red : .orange
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: indexPath.item % 2 == 0 ? collectionView.frame.size.width / 4 : collectionView.frame.size.width / 8, height: collectionView.frame.size.height - 10)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return UIEdgeInsets(top: 4, left: 4, bottom: 4, right: 4)
    }
    
}

// MARK: - TableviewDataSource/Delegate

extension DetailViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: menuCellId, for: indexPath)
        
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
