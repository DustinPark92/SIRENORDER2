//
//  StoreOrderCollectionViewHeader.swift
//  SIrenorder
//
//  Created by Dustin on 2020/08/28.
//  Copyright © 2020 Dustin. All rights reserved.
//

import UIKit

class StoreOrderCollectionViewHeader: UICollectionReusableView {
    
    // MARK: - Properties
    
    var label = UILabel()
    
    // MARK: - init
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(label)
        label.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 10, paddingLeft: 30)
        label.text = "dkjfkdjf"
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
