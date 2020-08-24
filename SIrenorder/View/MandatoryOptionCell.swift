//
//  MandatoryOptionCell.swift
//  SIrenorder
//
//  Created by Kang Mingu on 2020/08/23.
//  Copyright © 2020 Dustin. All rights reserved.
//

import UIKit

private let cellId = "cell"

class MandatoryOptionCell: UITableViewCell {
    
    // MARK: - Properties
    
    let tempLabel = UILabel()
    let sizeLabel = UILabel()
    
    lazy var iceButton: UIButton = {
        let button = UIButton()
        button.isSelected = false
        button.setTitle("ICE", for: .normal)
        button.backgroundColor = .black
        button.addTarget(self, action: #selector(handleIce), for: .touchUpInside)
        return button
    }()
    
    lazy var hotButton: UIButton = {
        let button = UIButton()
        button.isSelected = false
        button.frame.size = CGSize(width: 66, height: 44)
        button.setTitle("HOT", for: .normal)
        button.addTarget(self, action: #selector(handleHot), for: .touchUpInside)
        button.backgroundColor = .black
        return button
    }()
    
    let customView: UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 280))
        view.backgroundColor = .yellow
        return view
    }()
    
    let firstPriceLabel     = UILabel()
    let secondPriceLabel    = UILabel()
    let thirdPriceLabel     = UILabel()
    let fourthPriceLabel    = UILabel()
    
    lazy var normalSizeButton: UIButton = {
        let button = UIButton()
        button.isSelected = false
        button.setTitle("기본 크기", for: .normal)
        button.backgroundColor = .black
        button.addTarget(self, action: #selector(handleNormalSize), for: .touchUpInside)
        return button
    }()
    
    lazy var sizeUpButton: UIButton = {
        let button = UIButton()
        button.isSelected = false
        button.setTitle("사이즈 업", for: .normal)
        button.backgroundColor = .black
        button.addTarget(self, action: #selector(handleSizeUp), for: .touchUpInside)
        return button
    }()
    
    
    // MARK: - Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: cellId)
        
        if iceButton.isSelected {
            hotButton.backgroundColor = .black
        }
        
        addSubview(customView)
        customView.anchor(top: topAnchor, left: leftAnchor,
                          bottom: bottomAnchor, right: rightAnchor)
        customView.backgroundColor = .orange
        
        customView.addSubview(tempLabel)
        tempLabel.anchor(top: customView.topAnchor, left: customView.leftAnchor, paddingTop: 20, paddingLeft: 40)
        tempLabel.font = .systemFont(ofSize: 20)
        tempLabel.text = "temperature"
        
        let buttonStack = UIStackView(arrangedSubviews: [iceButton, hotButton])
        customView.addSubview(buttonStack)
        buttonStack.anchor(top: tempLabel.bottomAnchor, paddingTop: 10, width: 200, height: 60)
        buttonStack.spacing = 40
        buttonStack.distribution = .fillEqually
        buttonStack.centerXAnchor.constraint(equalTo: customView.centerXAnchor).isActive = true
        
        customView.addSubview(firstPriceLabel)
        firstPriceLabel.anchor(top: buttonStack.bottomAnchor, left: buttonStack.leftAnchor, paddingTop: 10, width: 80)
        firstPriceLabel.text = "0"
        firstPriceLabel.textAlignment = .center
        
        customView.addSubview(secondPriceLabel)
        secondPriceLabel.anchor(top: buttonStack.bottomAnchor, right: buttonStack.rightAnchor, paddingTop: 10, width: 80)
        secondPriceLabel.text = "0"
        secondPriceLabel.textAlignment = .center
        
        customView.addSubview(sizeLabel)
        sizeLabel.anchor(top: firstPriceLabel.bottomAnchor, left: customView.leftAnchor, paddingTop: 10, paddingLeft: 40)
        sizeLabel.font = .systemFont(ofSize: 20)
        sizeLabel.textAlignment = .left
        sizeLabel.text = "size"
        
        let buttonStack2 = UIStackView(arrangedSubviews: [normalSizeButton, sizeUpButton])
        customView.addSubview(buttonStack2)
        buttonStack2.anchor(top: sizeLabel.bottomAnchor, paddingTop: 10, width: 200, height: 60)
        buttonStack2.spacing = 40
        buttonStack2.distribution = .fillEqually
        buttonStack2.centerXAnchor.constraint(equalTo: customView.centerXAnchor).isActive = true
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
    // MARK: - Selector
    
    @objc func handleIce() {
        
    }
    @objc func handleHot() {
        
    }
    @objc func handleNormalSize() {
        
    }
    @objc func handleSizeUp() {
        
    }
    
    
    // MARK: - Helper

}
