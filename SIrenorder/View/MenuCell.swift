//
//  MenuCell.swift
//  SIrenorder
//
//  Created by Kang Mingu on 2020/08/22.
//  Copyright © 2020 Dustin. All rights reserved.
//

import UIKit

class MenuCell: UITableViewCell {
    
    // MARK: - Properties
    
    let titleLabel: UILabel = {
        let tl = UILabel()
        tl.font = .systemFont(ofSize: 30, weight: .light)
        return tl
    }()
    
    let priceLabel: UILabel = {
        let tl = UILabel()
        tl.font = .systemFont(ofSize: 20, weight: .medium)
        tl.adjustsFontSizeToFitWidth = true
        return tl
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(titleLabel)
        titleLabel.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, paddingLeft: 10)
        
        addSubview(priceLabel)
        priceLabel.anchor(top: topAnchor, bottom: bottomAnchor, right: rightAnchor, paddingRight: 10)
        
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
