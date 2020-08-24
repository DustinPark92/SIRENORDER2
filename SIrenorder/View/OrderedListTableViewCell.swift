//
//  OrderedListTableViewCell.swift
//  SIrenorder
//
//  Created by Dustin on 2020/08/22.
//  Copyright © 2020 Dustin. All rights reserved.
//

import UIKit

class OrderedListTableViewCell: UITableViewCell {
   
    
     let mainView : UIView = {
         let uv = UIView()
         uv.makeAborderWidth(border: 1, color: UIColor.black.cgColor)
        uv.backgroundColor = .gray
         return uv
     }()
     
     let orderDate: UILabel = {
         let text = UILabel()
         text.text = "2020년 8월 21일 11시 18분 11초"
         text.textAlignment = .center
         return text
     }()
     
     let receiptId: UILabel = {
         let text = UILabel()
         text.text = "asdlkfjasdsaf2"
         text.textAlignment = .center
         return text
     }()
     
     let storeName: UILabel = {
         let text = UILabel()
         text.text = "test cafe"
         text.textAlignment = .center
         return text
     }()
    
    let todalPrice: UILabel = {
        let text = UILabel()
        text.text = "20000"
        text.textAlignment = .center
        return text
    }()
    
    let statusLabel: UILabel = {
        let text = UILabel()
        text.text = "주문 완료"
        text.textAlignment = .center
        return text
    }()
     
     // MARK: - init
     
     override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
         super.init(style: style, reuseIdentifier: reuseIdentifier)
         backgroundColor = .white
         addSubview(mainView)
         addSubview(orderDate)
         addSubview(storeName)
        addSubview(todalPrice)
        addSubview(statusLabel)
        
        
         mainView.anchor(top:topAnchor,left: leftAnchor,bottom: bottomAnchor,right: rightAnchor,paddingTop: 5,paddingLeft: 5,paddingBottom: 5,paddingRight: 5)
        
        orderDate.anchor(left:leftAnchor,bottom: bottomAnchor,paddingLeft: 10,paddingBottom: 10)
        storeName.anchor(left:orderDate.rightAnchor,bottom: bottomAnchor,paddingLeft: 20,paddingBottom: 10)
        todalPrice.anchor(left:storeName.rightAnchor,bottom: bottomAnchor,paddingLeft: 10,paddingBottom: 10)
        
        statusLabel.anchor(top:topAnchor,right: rightAnchor,paddingTop: 10,paddingRight: 10)
        
        
        
        

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
