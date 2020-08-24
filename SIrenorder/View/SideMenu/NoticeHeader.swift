//
//  NoticeHeader.swift
//  SIrenorder
//
//  Created by Dustin on 2020/08/21.
//  Copyright © 2020 Dustin. All rights reserved.
//

import UIKit

class NoticeHeader: UIView {


        let mainLabel: UILabel = {
            let lb = UILabel()
            lb.text = "공지사항"
            lb.font = UIFont.boldSystemFont(ofSize: 40)
            return lb
        }()
        
        override init(frame: CGRect) {
            super.init(frame: frame)
            setDimensions(width: frame.width, height: 300)
            
            addSubview(mainLabel)
            mainLabel.anchor(left:leftAnchor,bottom: bottomAnchor,paddingLeft: 10,paddingBottom: 10)
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    

}
