//
//  StoreIntroductionModel.swift
//  SIrenorder
//
//  Created by Kang Mingu on 2020/08/23.
//  Copyright © 2020 Dustin. All rights reserved.
//

/*
 "store": [
 {
     "store_id": 1,
     "store_opentime": "10:30",
     "store_phone": "0212345678",
     "store_info": "안녕하세요 이 카페는 테스트용 카페입니다.",
     "store_latitude": 0.0,
     "store_closetime": "22:00",
     "store_longitude": 0.0,
     "store_daysoff": "매주 월, 화 휴무",
     "store_name": "test cafe",
     "store_location": "서울특별시 테스트구 테스트동 테스트로 111 테스트빌딩 2층",
     "type_code": "CAFE"
 },
 */

import Foundation

struct StoreIntroductionModel {
    
    var store_id = 1
    var store_opentime = ""
    var store_phone = ""
    var store_info = ""
    var store_latitude = 0.0
    var store_longitude = 0.0
    var store_closetime = ""
    var store_daysoff = ""
    var store_name = ""
    var store_location = ""
    var type_code = ""
    
}
