//
//  NoticeTableViewCell.swift
//  SIrenorder
//
//  Created by Dustin on 2020/08/21.
//  Copyright © 2020 Dustin. All rights reserved.
//

import UIKit

class NoticeTableViewCell: UITableViewCell {
    
    
    let title: UILabel = {
        let text = UILabel()
        text.text = "공지사항 제목"
        text.textAlignment = .center
        return text
    }()
    
    let content: UILabel = {
        let text = UILabel()
        text.text = "공지사항 내용"
        text.textAlignment = .center
        return text
    }()
    
    let notice_date: UILabel = {
        let text = UILabel()
        text.text = "2020년 8월 8일"
        text.textAlignment = .center
        return text
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .white
        addSubview(title)
        addSubview(content)
        addSubview(notice_date)
        
        title.anchor(top:topAnchor,left: leftAnchor,paddingTop: 20,paddingLeft: 40)
        content.anchor(top:title.bottomAnchor,left: leftAnchor,paddingTop: 20,paddingLeft: 40)
        notice_date.anchor(bottom:bottomAnchor,right: rightAnchor,paddingBottom: 10,paddingRight: 10)
        
    
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
