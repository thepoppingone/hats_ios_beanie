//
//  BeanieStore.swift
//  HatsDemoiOS
//
//  Created by Poh Peng Wang on 6/12/19.
//  Copyright © 2019 TopTier labs. All rights reserved.
//

import Foundation
import UIKit

class BeanieStore
{
    static let shared = BeanieStore()
    var storeItems: [BeanieDevice] = []
    var currentVC: UIViewController = UIViewController()
    
    private init()
    {
        let device1 = BeanieDevice(id: 1, name: "Ric's iPhone", brand: "Apple", model: "iPhone 7 Plus", operating_system: "iOS", user_group: "HATS", purchase_date: Date())
        let device2 = BeanieDevice(id: 2, name: "Ric's Pixel", brand: "Google", model: "Pixel 3a", operating_system: "Android", user_group: "HATS", purchase_date: Date())
        let device3 = BeanieDevice(id: 3, name: "Ric's Galaxy", brand: "Samsung", model: "Galaxy S10e", operating_system: "Android", user_group: "HATS", purchase_date: Date())
        let device4 = BeanieDevice(id: 4, name: "Ric's Mate 30", brand: "Huawei", model: "Mate 30 Pro", operating_system: "Android", user_group: "HATS", purchase_date: Date())
        let device5 = BeanieDevice(id: 5, name: "Ric's A2", brand: "Xiaomi", model: "A2", operating_system: "Android", user_group: "HATS", purchase_date: Date())
        
        self.storeItems.append(device1);
        self.storeItems.append(device2);
        self.storeItems.append(device3);
        self.storeItems.append(device4);
        self.storeItems.append(device5);
        
        // Set up API instance
    }
    
    public func addNewDevice(device: BeanieDevice){
        self.storeItems.append(device)
    }
    
    public func removeDevice(deviceId: Int){
//        self.storeItems.first(where: {$0.id == deviceId})?.markAsDeleted()
        if let row = self.storeItems.firstIndex(where: {$0.id == deviceId}) {
            self.storeItems[row] = BeanieDevice(id: deviceId, name: storeItems[row].name, brand: storeItems[row].brand, model: storeItems[row].model, operating_system: storeItems[row].operating_system, user_group: storeItems[row].user_group, purchase_date: storeItems[row].purchase_date, isDeleted: true)
        }
        
        NotificationCenter.default.post(name: .reload, object: nil)
    }
    
    public func findDevice(deviceId: Int) -> BeanieDevice?{
        return self.storeItems.first { (BeanieDevice) -> Bool in
            BeanieDevice.id == deviceId
        }
    }
    
    public func updateDevice(deviceId: Int, name: String, brand: String, model: String, operating_system: String, user_group: String, purchase_date: Date){
        if let row = self.storeItems.firstIndex(where: {$0.id == deviceId}) {
            self.storeItems[row] = BeanieDevice(id: deviceId, name: name, brand: brand, model: model, operating_system: operating_system, user_group: user_group, purchase_date: purchase_date, isDeleted: false)
        }
        
        NotificationCenter.default.post(name: .reload, object: nil)
    }
    
}
