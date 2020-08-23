//
//  StoreDetailHeaderCell.swift
//  SIrenorder
//
//  Created by Kang Mingu on 2020/08/21.
//  Copyright © 2020 Dustin. All rights reserved.
//

import UIKit

class DetailSlidingCell: UICollectionViewCell {
    
    // MARK: - Properties
    
    let titleLabel: UILabel = {
        let tl = UILabel()
        return tl
    }()
    
    // MARK: - init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(titleLabel)
        titleLabel.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingLeft: 4, paddingRight: 4)
        titleLabel.sizeToFit()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
