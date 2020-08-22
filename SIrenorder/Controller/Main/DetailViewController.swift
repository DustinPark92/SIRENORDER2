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
    
    lazy var rightBarItem: UIBarButtonItem = {
        let item = UIBarButtonItem(image: UIImage(systemName: "bookmark"),
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
//        view.layer.borderWidth = 0
        view.backgroundColor = .yellow
        view.frame.size = CGSize(width: 100, height: 100)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let textLabel: UILabel = {
        let tl = UILabel()
        tl.text = "store name"
        tl.font = .boldSystemFont(ofSize: 20)
        return tl
    }()
    
    let table: UITableView = {
        let tv = UITableView()
        tv.backgroundColor = .systemPink
        return tv
    }()
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        
    }
    
    // MARK: - Selector
    
    @objc func handleBookmark(sender: UIBarButtonItem) {
        rightBarItem.image = UIImage(systemName: "bookmark.fill")
    }
    
    // MARK: - Helper
    
    func configureUI() {
        view.backgroundColor = .white
        
        DetailSlidingCollectionView.delegate = self
        DetailSlidingCollectionView.dataSource = self
        
        navigationItem.title = name
        
        navigationItem.rightBarButtonItem = rightBarItem
        
        //add infoview
        view.addSubview(infoView)
        infoView.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, right: view.rightAnchor, height: 180)
        
        //add store title
        view.addSubview(textLabel)
        textLabel.anchor(top: infoView.safeAreaLayoutGuide.topAnchor, left: infoView.safeAreaLayoutGuide.leftAnchor, paddingTop: 20, paddingLeft: 20)
    
        //add sliding collectionview
        view.addSubview(DetailSlidingCollectionView)
        DetailSlidingCollectionView.register(DetailSlidingCell.self, forCellWithReuseIdentifier: SlidingCellId)
        DetailSlidingCollectionView.anchor(top: infoView.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, height: 50)
        
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


class ImageCell: UICollectionViewCell {
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .systemPink
        
        print("cell is here")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
