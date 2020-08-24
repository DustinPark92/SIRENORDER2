//
//  WriteViewController.swift
//  SIrenorder
//
//  Created by Dustin on 2020/08/21.
//  Copyright © 2020 Dustin. All rights reserved.
//


import UIKit



class WriteViewController: UIViewController {
    let networkModel = CallRequest()
    let networkURL = NetWorkURL()
    
    var noticeList = [NoticeModel]()
    
    let titleTf: UITextField = {
        let tf = UITextField()
        tf.placeholder = "제목을 입력해주세요."
        tf.borderStyle = .line
        return tf
    }()
    
    let contentTv: UITextView = {
        let tv = UITextView()
        tv.makeAborderWidth(border: 1, color: UIColor.black.cgColor)
        return tv
    }()
    
    let sendButton: UIButton = {
        let bt = UIButton()
        bt.setTitle("보내기", for: .normal)
        bt.backgroundColor = .red
        bt.addTarget(self, action: #selector(handleButton), for: .touchUpInside)
        return bt
    }()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        title = "1:1 문의쓰기"
        
        
    }
    
    
    func configureUI() {
        view.backgroundColor = .white
        view.addSubview(titleTf)
        view.addSubview(contentTv)
        view.addSubview(sendButton)
        
        titleTf.anchor(top:view.safeAreaLayoutGuide.topAnchor,left: view.leftAnchor,right:view.rightAnchor,height: 44)
        contentTv.anchor(top:titleTf.bottomAnchor,left: view.leftAnchor,right: view.rightAnchor )
        sendButton.anchor(top:contentTv.bottomAnchor,left: view.leftAnchor,bottom: view.safeAreaLayoutGuide.bottomAnchor,right: view.rightAnchor,height: 50)
        
    }
    
    @objc func handleButton() {
        
        if titleTf.text != "" &&
            contentTv.text != "" {
            
            guard let titleText = titleTf.text else { return }
            guard let contentText = contentTv.text else {
                return
            }
            
            let param = ["email":"sky_battle@naver.com",
                         "title": titleText,
                         "content": contentText]
            
            networkModel.post(method: .post,param: param, url: networkURL.requestRegist) { (json) in
                if json["result"].boolValue {
                    self.navigationController?.popViewController(animated: true)
                }
            }
            
            
        } else {
            let alert = UIAlertController(title: "등록 실패", message: "내용을 입력해주세요.", preferredStyle: .alert)

            let ok = UIAlertAction(title: "확인", style: .default) { completion in
                
            }
            alert.addAction(ok)

            
            present(alert, animated: true , completion: nil)
        }
        
    }
    
    
    
    
}


