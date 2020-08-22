//
//  OrderedListTableViewCell.swift
//  SIrenorder
//
//  Created by Dustin on 2020/08/22.
//  Copyright © 2020 Dustin. All rights reserved.
//

import UIKit

class OrderedListTableViewCell: UITableViewCell {
    

       var total_price = 21000
    
     let mainView : UIView = {
         let uv = UIView()
         uv.makeAborderWidth(border: 1, color: UIColor.black.cgColor)
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
     
     // MARK: - init
     
     override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
         super.init(style: style, reuseIdentifier: reuseIdentifier)
         backgroundColor = .white
         addSubview(mainView)
         mainView.anchor(top:topAnchor,left: leftAnchor,bottom: bottomAnchor,right: rightAnchor,paddingTop: 5,paddingLeft: 5,paddingBottom: 5,paddingRight: 5)

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
