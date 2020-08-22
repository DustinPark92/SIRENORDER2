//
//  NoticeDetailTableViewCell.swift
//  SIrenorder
//
//  Created by Dustin on 2020/08/22.
//  Copyright © 2020 Dustin. All rights reserved.
//

import UIKit

class UserRequestDetailTableViewCell: UITableViewCell {

    let anwerLabel: UILabel = {
        let text = UILabel()
        text.text = "공지사항 제목"
        text.textAlignment = .center
        text.font = UIFont.systemFont(ofSize: 12)
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
    
    let notiLabel : UILabel = {
        let lb = UILabel()
        lb.text = "답변은 등록하신 이메일로 보내집니다"
        return lb
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .white
        addSubview(content)
        addSubview(notice_date)
        addSubview(anwerLabel)
        addSubview(notiLabel)
        
        notice_date.anchor(top:topAnchor,left: leftAnchor,paddingLeft: 10)
        content.anchor(top:notice_date.bottomAnchor,left: leftAnchor,paddingTop: 5,paddingLeft: 10)
        anwerLabel.anchor(top:topAnchor,right: rightAnchor,paddingRight: 5)
        
        notiLabel.anchor(bottom: bottomAnchor,paddingBottom: 30)
        notiLabel.centerX(inView: self)
        
    
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
