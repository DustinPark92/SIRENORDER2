//
//  NoticeTitleTableViewCell.swift
//  SIrenorder
//
//  Created by Dustin on 2020/08/21.
//  Copyright © 2020 Dustin. All rights reserved.
//

import UIKit

class NoticeTitleTableViewCell: UITableViewCell {
    
    let title: UILabel = {
        let text = UILabel()
        text.text = "공지사항 제목"
        text.font = UIFont.boldSystemFont(ofSize: 20)
        text.textAlignment = .left
        return text
    }()
    

    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(title)
        
        title.centerY(inView: self,leftAnchor: leftAnchor,paddingLeft: 10)
       
        
        
        
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
