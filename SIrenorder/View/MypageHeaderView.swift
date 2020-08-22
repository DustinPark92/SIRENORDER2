//
//  MypageHeaderView.swift
//  SIrenorder
//
//  Created by Dustin on 2020/08/22.
//  Copyright © 2020 Dustin. All rights reserved.
//

import UIKit


class MypageHeaderView: UIView {
    
    var topView : UIView = {
        let uv = UIView()
        uv.makeAborderWidth(border: 1, color: UIColor.darkGray.cgColor)
        uv.backgroundColor  = .white
        return uv
    }()
    
    let topViewLabel : UILabel = {
        let lb = UILabel()
        lb.text = "이승재님 안녕하세요!"
        lb.font = UIFont.boldSystemFont(ofSize: 30)
        return lb
    }()
    
    let emailImgView : UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(systemName: "plus")
        iv.setDimensions(width: 20, height: 20)
        return iv
    }()
    
    let phoneImgView : UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(systemName: "plus")
        iv.setDimensions(width: 20, height: 20)
        return iv
    }()
    
    let emailLabel : UILabel = {
        let lb = UILabel()
        lb.text = "sky_battel@naver.com"
        return lb
    }()
    let phoneNumberLabel : UILabel = {
        let lb = UILabel()
        lb.text = "01093756927"
        return lb
    }()
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 50
        layout.itemSize = CGSize(width: 70, height: 90)
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .gray
        return cv
    }()
    
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .blue
        
        addSubview(topView)
        addSubview(emailImgView)
        addSubview(emailLabel)
        addSubview(phoneImgView)
        addSubview(phoneNumberLabel)
        addSubview(collectionView)
        
        topView.addSubview(topViewLabel)
        topView.anchor(top:topAnchor,left: leftAnchor,right: rightAnchor,paddingTop: 50,paddingLeft: 30,paddingRight: 30,height: 100)
        topViewLabel.anchor(top:topView.topAnchor,left: topViewLabel.leftAnchor,bottom:topViewLabel.bottomAnchor,right: topViewLabel.rightAnchor,paddingTop: 10,paddingLeft: 10,paddingBottom: 10,paddingRight: 10)
        
        emailImgView.anchor(top:topView.bottomAnchor,left: leftAnchor,paddingTop: 10,paddingLeft: 10)
        emailLabel.anchor(top:topView.bottomAnchor,left:emailImgView.rightAnchor,paddingTop: 10,paddingLeft: 5)
        
        phoneImgView.anchor(top:emailImgView.bottomAnchor,left: leftAnchor,paddingTop: 5,paddingLeft: 10)
        phoneNumberLabel.anchor(top:emailLabel.bottomAnchor,left:phoneImgView.rightAnchor,paddingTop: 5,paddingLeft: 5)
        
        collectionView.anchor(top:phoneNumberLabel.bottomAnchor,left: leftAnchor,bottom: bottomAnchor,right: rightAnchor)
        
        collectionView.backgroundColor = .red

        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    

}
