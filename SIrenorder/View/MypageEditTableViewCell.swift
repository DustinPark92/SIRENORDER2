//
//  MypageEditTableViewCell.swift
//  SIrenorder
//
//  Created by Dustin on 2020/08/22.
//  Copyright © 2020 Dustin. All rights reserved.
//

import UIKit

class MypageEditTableViewCell: UITableViewCell {

       let titleLabel: UILabel = {
           let text = UILabel()
           text.text = "내 정보 변경"
           text.font = UIFont.systemFont(ofSize: 10)
           text.textAlignment = .center
           return text
       }()
    

       // MARK: - init
       
       override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
           super.init(style: style, reuseIdentifier: reuseIdentifier)
           backgroundColor = .white
          
          addSubview(titleLabel)
          titleLabel.anchor(top:topAnchor,left: leftAnchor,paddingTop: 10,paddingLeft: 10)
         
       
          

       }
       

       
       required init?(coder: NSCoder) {
           fatalError("init(coder:) has not been implemented")
       }


}
