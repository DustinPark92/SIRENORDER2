//
//  CompletedChangedPassViewController.swift
//  SIrenorder
//
//  Created by Dustin on 2020/08/24.
//  Copyright © 2020 Dustin. All rights reserved.
//

import UIKit

class CompletedChangedPassViewController: UIViewController {
    
    private let compImg : UIImageView = {
        let iv = UIImageView()
        iv.setDimensions(width: 120, height: 120)
        iv.image = UIImage(systemName: "checkmark.circle.fill")
        iv.tintColor = .black
        return iv
    }()
    
    private let mainLabel : UILabel = {
        let lb = UILabel()
        lb.text = "비밀번호 변경 완료"
        lb.font = UIFont.boldSystemFont(ofSize: 20)
        return lb
    }()
    
    private let subLabel : UILabel = {
        let lb = UILabel()
        lb.text = "새로운 비밀번호로 로그인해주세요"
        lb.font = UIFont.boldSystemFont(ofSize: 10)
        return lb
    }()
    private let sendButton : UIButton = {
        let bt = UIButton()
        bt.backgroundColor = .black
        bt.setTitle("로그인 하러 가기", for: .normal)
        bt.addTarget(self, action: #selector(handleSend), for: .touchUpInside)
        return bt
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureUI()
    }
    
    func configureUI() {
        
        view.addSubview(compImg)
        view.addSubview(mainLabel)
        view.addSubview(subLabel)
        view.addSubview(sendButton)
        
        mainLabel.anchor(top:view.topAnchor,paddingTop: 100)
        mainLabel.centerX(inView: view)
        
        compImg.anchor(top:mainLabel.bottomAnchor,paddingTop: 10)
        compImg.centerX(inView: view)
        
        subLabel.anchor(top:compImg.bottomAnchor,paddingTop: 10)
        subLabel.centerX(inView: view)
        
        
        sendButton.anchor(top:subLabel.bottomAnchor,paddingTop: 10)
        sendButton.centerX(inView: view)
        sendButton.setDimensions(width: view.frame.width - 80, height: 50)
        
        
        
        
        
        
        
    }
    
    @objc func handleSend() {
        
        
    }

}
