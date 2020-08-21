//
//  StoreDetailCollectionViewController.swift
//  SIrenorder
//
//  Created by Dustin on 2020/08/21.
//  Copyright © 2020 Dustin. All rights reserved.
//


import UIKit

private let reuseIdentifier = "Cell"
private let headerIdentifier = "header"

class StoreDetailCollectionViewController: UICollectionViewController {
    
    // MARK: - Properties
    
    var name: String?
    
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        
//        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        
        // register Header
        collectionView.register(StoreDetailHeader.self,
                                forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                                withReuseIdentifier: headerIdentifier)
        
    }
    
    
    // MARK: - Selector
    
    @objc func buttonTapped() {
        print("tapped")
    }

    
    // MARK: - Helper
    
    func configureUI() {
        
//        collectionView.backgroundColor = .yellow
        navigationItem.title = name
        
        let rightItem: UIBarButtonItem = {
            let button = UIBarButtonItem(image: UIImage(systemName: "bookmark"),
                                         style: .plain,
                                         target: self,
                                         action: #selector(buttonTapped))
            return button
        }()
        navigationItem.rightBarButtonItem = rightItem
        
    }
    

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return 0
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 0
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
    
        return cell
    }
    
    // header setting
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerIdentifier, for: indexPath) as! StoreDetailHeader
            return headerView
        default:
            assert(false)
        }
        
    }
    
}

extension StoreDetailCollectionViewController: UICollectionViewDelegateFlowLayout {
    
    // header sizing
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        
        return CGSize(width: view.frame.width, height: 300)
    }
}
