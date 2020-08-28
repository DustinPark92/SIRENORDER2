//
//  MandatoryOptionCell.swift
//  SIrenorder
//
//  Created by Kang Mingu on 2020/08/23.
//  Copyright © 2020 Dustin. All rights reserved.
//

import UIKit

private let cellId = "cell"
private let reusableCell = "cell2"
private let header = "headerCell"

class MandatoryOptionCell: UITableViewCell {
    
    // MARK: - Properties
    
    let collectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .green
        layout.itemSize = CGSize(width: 100, height: 60)
        return cv
    }()
    
    
    // MARK: - Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: cellId)
        
        addSubview(collectionView)
        collectionView.anchor(top: topAnchor, left: leftAnchor,
                              bottom: bottomAnchor, right: rightAnchor)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
    
    
    // MARK: - Selector
    
    
    // MARK: - Helper

}
