//
//  StoreDetailHeader.swift
//  SIrenorder
//
//  Created by Kang Mingu on 2020/08/21.
//  Copyright © 2020 Dustin. All rights reserved.
//

import UIKit

class StoreDetailHeader: UICollectionReusableView {
    
    // MARK: - Properties
    
    let tl: UILabel = {
        let label = UILabel()
        label.text = "fuck you man 🖕"
        return label
    }()
    
    
    // MARK: - init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        print("hi??????")
        addSubview(tl)
        tl.anchor(top:topAnchor, left: leftAnchor)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
