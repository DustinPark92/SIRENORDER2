//
//  StoreInfoViewController.swift
//  SIrenorder
//
//  Created by Kang Mingu on 2020/08/23.
//  Copyright © 2020 Dustin. All rights reserved.
//

import UIKit

class StoreInfoViewController: UIViewController {
    
    // MARK: - Properties
    
    var storeId = 0
    var storeName = ""
    var typeName = ""
    
    let networkModel = CallRequest()
    let networkURL = NetWorkURL()
    
    var storeInfo = [StoreIntroductionModel]()
    
    let mapView: UIView = {
        let view = UIView()
        return view
    }()
    
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(storeId)
        configureUI()
        
        navigationItem.title = storeName
        
        // 지도 넣기
        view.addSubview(mapView)
        mapView.anchor(top:view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, right: view.rightAnchor, width: view.frame.width, height: 240)
        mapView.backgroundColor = .lightGray
        
        // 가게소개
        let subjectLabel = labelMaker(font: .boldSystemFont(ofSize: 24))
        view.addSubview(subjectLabel)
        subjectLabel.anchor(top: mapView.bottomAnchor, left: view.leftAnchor, paddingTop: 30, paddingLeft: 30)
        
        // 가게소개 멘트
        let introductionLabel = labelMaker(text: "", font: .systemFont(ofSize: 22))
        view.addSubview(introductionLabel)
        introductionLabel.numberOfLines = 0
        introductionLabel.anchor(top: subjectLabel.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 10, paddingLeft: 30, paddingRight: 30)
        
        // 가게 영업시간
        let operationTimeLabel = labelMaker(text: "", font: .systemFont(ofSize: 22))
        view.addSubview(operationTimeLabel)
        operationTimeLabel.anchor(top: introductionLabel.bottomAnchor, left: view.leftAnchor, paddingTop: 40, paddingLeft: 30)
        
        // 가게 쉬는날
        let dayoff = labelMaker(text: "", font: .systemFont(ofSize: 22))
        view.addSubview(dayoff)
        dayoff.anchor(top: operationTimeLabel.bottomAnchor, left: view.leftAnchor, paddingTop: 10, paddingLeft: 30)
        
        // 전화
        let phoneLabel = labelMaker(text: "", font: .systemFont(ofSize: 22))
        view.addSubview(phoneLabel)
        phoneLabel.anchor(top: dayoff.bottomAnchor, left: view.leftAnchor, paddingTop: 40, paddingLeft: 30)
        
        // 주소
        let addressLabel = labelMaker(text: "", font: .systemFont(ofSize: 22))
        view.addSubview(addressLabel)
        addressLabel.anchor(top: phoneLabel.bottomAnchor, left: view.leftAnchor,right: view.rightAnchor, paddingTop: 10, paddingLeft: 30, paddingRight: 30)
        addressLabel.numberOfLines = 0
        
        
        let param = ["store_id": storeId]
        
        networkModel.get(method: .get, param: param, url: networkURL.storeIntroductionURL) { json in
            
            if json["result"].boolValue {
                
                introductionLabel.text = json["store_info"].stringValue
                operationTimeLabel.text = "open : " + json["store_opentime"].stringValue + " ~ " +  json["store_closetime"].stringValue
                dayoff.text = "휴무 : " + json["store_daysoff"].stringValue
                phoneLabel.text = "📱 " + json["store_phone"].stringValue
                addressLabel.text = "📍 " + json["store_location"].stringValue
                
            }
            
        }
        
    }
    

    // MARK: - Helper
    
    func configureUI() {
        
        view.backgroundColor = .white
    }
    
    func labelMaker(text: String = "가게소개", font: UIFont) -> UILabel {
        let tl = UILabel()
        tl.text = text
        tl.font = font
        return tl
    }

}
