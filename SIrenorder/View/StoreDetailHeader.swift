//
//  StoreDetailHeader.swift
//  SIrenorder
//
//  Created by Kang Mingu on 2020/08/21.
//  Copyright © 2020 Dustin. All rights reserved.
//

import UIKit

private let cellIdentifier = "cell"

class StoreDetailHeader: UICollectionReusableView {
    
    let headerCellIdentifier = "HeaderCell"
    
    // MARK: - Properties
    
//    let layout = UICollectionViewFlowLayout()
    
    let titleLabel: UILabel = {
        let text = UILabel()
        text.text = "title man" // 백엔드에서 받아오기
        text.textAlignment = .left
        return text
    }()
    
    
    // MARK: - init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .orange
        
        addSubview(titleLabel)
        titleLabel.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor)
     
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}



// MARK: - collectionView dataSource/delegate


extension StoreDetailHeader: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: headerCellIdentifier, for: indexPath)
        
        cell.backgroundColor = indexPath.row % 2 == 0 ? .red : .systemBlue
        cell.layer.cornerRadius = 20
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: indexPath.row % 2 == 0 ? collectionView.frame.size.width / 3: collectionView.frame.size.width / 6, height: 50)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    
    
}
