//
//  ShoppingCartTableViewCell.swift
//  SIrenorder
//
//  Created by Dustin on 2020/08/24.
//  Copyright © 2020 Dustin. All rights reserved.
//

import UIKit

class ShoppingCartTableViewCell: UITableViewCell {
    
    let mainView : UIView = {
        let uv = UIView()
        uv.makeAborderWidth(border: 1, color: UIColor.lightGray.cgColor)
        uv.backgroundColor = .lightGray
        return uv
    }()
    
    let menuTitle : UILabel = {
        let lb = UILabel()
        lb.font = UIFont.systemFont(ofSize: 25)
        lb.text = "레몬 에이드"
        return lb
    }()
    
    let menuPriceLabel : UILabel = {
        let lb = UILabel()
        lb.text = "2800원"
        lb.font = UIFont.systemFont(ofSize: 25)
        return lb
    }()
    
    let extraLabel : UILabel = {
        let lb = UILabel()
        lb.text = "ICE X 0"
        lb.font = UIFont.systemFont(ofSize: 15)
        return lb
    }()
    
    let extraPriceLabel : UILabel = {
        let lb = UILabel()
        lb.text = "+ 0원"
        lb.font = UIFont.systemFont(ofSize: 15)
        return lb
    }()
    
    let sizeLabel : UILabel = {
        let lb = UILabel()
        lb.text = "기본크기 X 0"
        lb.font = UIFont.systemFont(ofSize: 15)
        return lb
    }()
    
    let sizePriceLabel : UILabel = {
        let lb = UILabel()
        lb.text = " +0원"
        lb.font = UIFont.systemFont(ofSize: 15)
        return lb
    }()
    
    let totalPriceMultiply : UILabel = {
        let lb = UILabel()
        lb.text = "2800원 X 1"
        lb.font = UIFont.systemFont(ofSize: 20)
        return lb
    }()
    
    let totalPrcie : UILabel = {
        let lb = UILabel()
        lb.text = "2800원"
        lb.font = UIFont.systemFont(ofSize: 20)
        return lb
    }()
    
    let deleteButton : UIButton = {
        let bt = UIButton(type: .system)
        bt.setImage(UIImage(systemName: "xmark.circle"), for: .normal)
        bt.setDimensions(width: 40, height: 40)
        return bt
    }()
    
    let rightView : UIView = {
        let uv = UIView()

        
        return uv
    }()
    
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(mainView)
        mainView.addSubview(menuTitle)
        mainView.addSubview(menuPriceLabel)
        mainView.addSubview(extraLabel)
        mainView.addSubview(extraPriceLabel)
        mainView.addSubview(sizeLabel)
        mainView.addSubview(sizePriceLabel)
        mainView.addSubview(totalPrcie)
        mainView.addSubview(totalPriceMultiply)
        rightView.addSubview(deleteButton)
        mainView.addSubview(rightView)
        mainView.anchor(top:topAnchor,left: leftAnchor,bottom: bottomAnchor,right: rightAnchor,paddingTop: 5,paddingLeft: 5,paddingBottom: 5,paddingRight: 5)
        
        
        rightView.anchor(top:topAnchor,bottom: bottomAnchor,right: rightAnchor,width: 80)
        
        deleteButton.center(inView: rightView)
        
        
        menuTitle.anchor(top:mainView.topAnchor,left: mainView.leftAnchor,paddingTop: 10,paddingLeft: 10)
        menuPriceLabel.anchor(top:mainView.topAnchor,right: rightView.leftAnchor,paddingTop: 10,paddingRight: 10)
        
        extraLabel.anchor(top:menuTitle.bottomAnchor,left:mainView.leftAnchor,paddingTop: 10,paddingLeft: 10)
        extraPriceLabel.anchor(top:menuPriceLabel.bottomAnchor,right: rightView.leftAnchor,paddingTop: 10,paddingRight: 10)
        
        sizeLabel.anchor(top:extraLabel.bottomAnchor,left:mainView.leftAnchor,paddingTop: 10,paddingLeft: 10)
        sizePriceLabel.anchor(top:extraPriceLabel.bottomAnchor,right: rightView.leftAnchor,paddingTop: 10,paddingRight: 10)
        
        totalPrcie.anchor(bottom: bottomAnchor,right: rightView.leftAnchor,paddingBottom: 10,paddingRight: 10)
        
        totalPriceMultiply.anchor(left:mainView.leftAnchor,bottom: bottomAnchor,paddingLeft: 10,paddingBottom: 10)
        
        
        
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
}
