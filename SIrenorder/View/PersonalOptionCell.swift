//
//  PersonalOptionCell.swift
//  SIrenorder
//
//  Created by Kang Mingu on 2020/08/23.
//  Copyright © 2020 Dustin. All rights reserved.
//

import UIKit

class PersonalOptionCell: UITableViewCell {
    
    
     let nameLabel : UILabel = {
        let lb = UILabel()
        lb.text = "시럽 추가"
        return lb
    }()
    
     let moneyLabel : UILabel = {
        let lb = UILabel()
        lb.text = "+    300"
        return lb
    }()

    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(nameLabel)
        addSubview(moneyLabel)
        
        nameLabel.centerY(inView: self, leftAnchor: leftAnchor, paddingLeft: 5)
        moneyLabel.centerY(inView: self)
        moneyLabel.anchor(right:rightAnchor,paddingRight: 5)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    


}
