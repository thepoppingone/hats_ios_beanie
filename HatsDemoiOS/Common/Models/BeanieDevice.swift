//
//  BeanieDevice.swift
//  HatsDemoiOS
//
//  Created by Poh Peng Wang on 25/11/19.
//  Copyright © 2019 TopTier labs. All rights reserved.
//

import Foundation

struct BeanieDevice: Codable {
    var id: Int
    var name: String
    var brand: String
    var model: String
    var operating_system: String
    var user_group: String
    var purchase_date: Date

}
