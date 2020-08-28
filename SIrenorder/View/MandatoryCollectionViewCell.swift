//
//  MandatoryCollectionViewCell.swift
//  SIrenorder
//
//  Created by Dustin on 2020/08/28.
//  Copyright © 2020 Dustin. All rights reserved.
//

import UIKit

class MandatoryCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Properties
    
    let boxView : UIView = {
        let uv = UIView()
        uv.backgroundColor = .black
        uv.setDimensions(width: 100, height: 100)
        return uv
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: - init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(boxView)
        boxView.anchor(top:topAnchor,left: leftAnchor,bottom: bottomAnchor,right: rightAnchor)
        
        addSubview(nameLabel)
        nameLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        nameLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        nameLabel.textColor = .white
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
