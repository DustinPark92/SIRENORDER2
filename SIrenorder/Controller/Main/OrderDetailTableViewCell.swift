
//
//  OrderDetailTableViewCell.swift
//  SIrenorder
//
//  Created by Dustin on 2020/08/23.
//  Copyright © 2020 Dustin. All rights reserved.
//

import UIKit

class OrderDetailTableViewCell: UITableViewCell {
    
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
         lb.font = UIFont.systemFont(ofSize: 30)
        return lb
    }()
    
    let totalPrcie : UILabel = {
        let lb = UILabel()
        lb.text = "2800원"
         lb.font = UIFont.boldSystemFont(ofSize: 30)
        return lb
    }()
    
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(menuTitle)
        addSubview(menuPriceLabel)
        addSubview(extraLabel)
        addSubview(extraPriceLabel)
        addSubview(sizeLabel)
        addSubview(sizePriceLabel)
        addSubview(totalPrcie)
        addSubview(totalPriceMultiply)
        
        
        menuTitle.anchor(top:topAnchor,left: leftAnchor,paddingTop: 10,paddingLeft: 10)
        menuPriceLabel.anchor(top:topAnchor,right: rightAnchor,paddingTop: 10,paddingRight: 10)
        
        extraLabel.anchor(top:menuTitle.bottomAnchor,left:leftAnchor,paddingTop: 10,paddingLeft: 10)
        extraPriceLabel.anchor(top:menuPriceLabel.bottomAnchor,right: rightAnchor,paddingTop: 10,paddingRight: 10)
        
        sizeLabel.anchor(top:extraLabel.bottomAnchor,left:leftAnchor,paddingTop: 10,paddingLeft: 10)
        sizePriceLabel.anchor(top:extraPriceLabel.bottomAnchor,right: rightAnchor,paddingTop: 10,paddingRight: 10)
        
        totalPrcie.anchor(top:sizePriceLabel.bottomAnchor,right: rightAnchor,paddingTop: 10,paddingRight: 10)
        
        totalPriceMultiply.anchor(top:sizeLabel.bottomAnchor,left:leftAnchor,paddingTop: 10,paddingLeft: 10)

        
        
        
        
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
