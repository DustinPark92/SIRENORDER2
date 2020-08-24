//
//  MypagePasswordChangeViewController.swift
//  SIrenorder
//
//  Created by Dustin on 2020/08/24.
//  Copyright © 2020 Dustin. All rights reserved.
//

import UIKit

class MypagePasswordChangeViewController: UIViewController {
    
    private let lockImg : UIImageView = {
        let iv = UIImageView()
        iv.setDimensions(width: 120, height: 120)
        iv.image = UIImage(systemName: "lock")
        iv.tintColor = .black
        return iv
    }()
    
    private let mainLabel : UILabel = {
        let lb = UILabel()
        lb.text = "비밀번호 변경"
        lb.font = UIFont.boldSystemFont(ofSize: 20)
        return lb
    }()
    
    private let textField : UITextField = {
        let tf = UITextField()
        tf.placeholder = "현재 비밀번호 입력"
        tf.borderStyle = .line
        tf.isSecureTextEntry = true
        tf.backgroundColor = .init(white: 1, alpha: 0.8)
        return tf
    }()
    
    private let sendButton : UIButton = {
        let bt = UIButton()
        bt.backgroundColor = .black
        bt.setTitle("입력하기", for: .normal)
        bt.addTarget(self, action: #selector(handleSend), for: .touchUpInside)
        return bt
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureUI()
    }
    
    func configureUI() {
        view.addSubview(lockImg)
        view.addSubview(mainLabel)
        view.addSubview(sendButton)
        view.addSubview(textField)
        
        lockImg.center(inView: view, yConstant: -180)
        mainLabel.anchor(top:lockImg.bottomAnchor,paddingTop: 10)
        mainLabel.centerX(inView: view)
        
        textField.anchor(top:mainLabel.bottomAnchor,paddingTop: 10)
        textField.centerX(inView: view)
        textField.setDimensions(width: view.frame.width - 40, height: 50)
        
        
        sendButton.anchor(top:textField.bottomAnchor,paddingTop:  10)
        sendButton.centerX(inView: view)
        sendButton.setDimensions(width: view.frame.width - 40, height: 50)
        

        
        
    }
    
    @objc func handleSend() {
        let controller = CompletedChangedPassViewController()
        self.present(controller, animated: true, completion: nil)
        
        
        
    }


}
