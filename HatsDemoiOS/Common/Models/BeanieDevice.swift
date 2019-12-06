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
    var isDeleted: Bool

    public init(id: Int, name: String, brand: String, model: String, operating_system: String, user_group: String, purchase_date: Date, isDeleted: Bool = false){
        self.id = id
        self.name = name
        self.brand = brand
        self.model = model
        self.operating_system = operating_system
        self.user_group = user_group
        self.purchase_date = purchase_date
        self.isDeleted = isDeleted
    }
    
    public mutating func markAsDeleted() -> Void{
        self.isDeleted = true
    }
}
