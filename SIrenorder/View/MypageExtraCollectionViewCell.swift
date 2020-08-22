//
//  MypageExtraCollectionViewCell.swift
//  SIrenorder
//
//  Created by Dustin on 2020/08/22.
//  Copyright © 2020 Dustin. All rights reserved.
//

import UIKit

class MypageExtraCollectionViewCell: UICollectionViewCell {
    
    private let mainView : UIView = {
        let uv = UIView()
        uv.backgroundColor = .white
        return uv
    }()
    
    private let topLabel : UILabel = {
        let lb = UILabel()
        lb.text = "주문내역"
        lb.backgroundColor = .white
        return lb
    }()
    
    private let bottomLabel : UILabel = {
        let lb = UILabel()
        lb.text = "316"
        lb.backgroundColor = .gray
        return lb
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(mainView)
        mainView.addSubview(topLabel)
        mainView.addSubview(bottomLabel)
        
        
        mainView.anchor(top:safeAreaLayoutGuide.topAnchor,left: safeAreaLayoutGuide.leftAnchor,bottom: safeAreaLayoutGuide.bottomAnchor,right: safeAreaLayoutGuide.rightAnchor)
        
        topLabel.anchor(top:mainView.safeAreaLayoutGuide.topAnchor,left: mainView.safeAreaLayoutGuide.leftAnchor,right: mainView.safeAreaLayoutGuide.rightAnchor)
        topLabel.centerY(inView: mainView)
        bottomLabel.anchor(left:leftAnchor,bottom: bottomAnchor,right: rightAnchor)
        
        
        
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
