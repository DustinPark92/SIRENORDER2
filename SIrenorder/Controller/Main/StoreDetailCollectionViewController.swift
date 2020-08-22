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
private let slidingCellIdentifier = "slidingCell"
private let slidingCV = "slidingCV"

let layout = UICollectionViewFlowLayout()

class StoreDetailCollectionViewController: UICollectionViewController {
    
    // MARK: - Properties
    
    var name: String?
    
    let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
    
    let nextButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("next", for: .normal)
        button.addTarget(self, action: #selector(handleNext), for: .touchUpInside)
        return button
    }()
    
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        

        cv.dataSource = self
        cv.delegate = self

        layout.scrollDirection = .horizontal
        
        //register sliding collectionview
        collectionView.addSubview(cv)
        cv.anchor(top: collectionView.topAnchor)
        
        //register sliding cell
        cv.register(DetailSlidingCell.self, forCellWithReuseIdentifier: slidingCellIdentifier)
        cv.backgroundColor = .black
        
        // register menu cell
        self.collectionView.register(MenuCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        
        // register Header
        collectionView.register(StoreDetailHeader.self,
                                forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                                withReuseIdentifier: headerIdentifier)
        configureUI()
        
    }
    
    
    // MARK: - Selector
    
    @objc func buttonTapped() {
        print("tapped")
    }
    
    @objc func handleNext() {
        let vc = DetailViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
    // MARK: - Helper
    
    func configureUI() {
        
        collectionView.backgroundColor = .yellow
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
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView == cv {
            return 3
        }
        
        return 10
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! DetailSlidingCell
        
        cell.backgroundColor = .systemPurple
        cell.layer.cornerRadius = 18
        
        return cell
    }
    
    // header setting
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerIdentifier, for: indexPath) as! StoreDetailHeader
        
        header.backgroundColor = .white
        header.addSubview(nextButton)
        nextButton.anchor(top: header.topAnchor, right: header.rightAnchor, paddingTop: 20, paddingRight: 20)
        
        
        return header
    }
    
}

extension StoreDetailCollectionViewController: UICollectionViewDelegateFlowLayout {
    
    // header sizing
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        
        return CGSize(width: view.frame.width, height: 200)
    }
    
    // cell cizing
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: collectionView.frame.size.width - 20, height: 60)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }
}
