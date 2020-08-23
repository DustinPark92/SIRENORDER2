//
//  StoreMenuModel.swift
//  SIrenorder
//
//  Created by Kang Mingu on 2020/08/22.
//  Copyright © 2020 Dustin. All rights reserved.
//

/*
 "menu": [
 {
     "store_id": 1,
     "category_id": 1,
     "menu_info": "좋은 원두를 사용한 아메키라노",
     "menu_name": "아메리카노",
     "menu_defaultprice": 1500,
     "menu_id": 4
 }
 */

import Foundation

struct StoreMenuModel {
    
    var store_id: Int = 0
    var category_id: Int = 0
    var menu_info: String = ""
    var menu_name: String = ""
    var menu_defaultprice: Int = 0
    var menu_id: Int = 0
}
