//
//  UserDataManager.swift
//  HatsDemoiOS
//
//  Created by Rootstrap on 15/2/16.
//  Copyright © 2016 Rootstrap. All rights reserved.
//

import UIKit

class UserDataManager: NSObject {
  
  static var currentUser: User? {
    get {
      let defaults = UserDefaults.standard
      if
        let data = defaults.data(forKey: "HatsDemoiOS-user"),
        let user = try? JSONDecoder().decode(User.self, from: data)
      {
        return user
      }
      return nil
    }
    
    set {
      let user = try? JSONEncoder().encode(newValue)
      UserDefaults.standard.set(user, forKey: "HatsDemoiOS-user")
    }
  }
  
  class func deleteUser() {
    UserDefaults.standard.removeObject(forKey: "HatsDemoiOS-user")
  }
  
  static var isUserLogged: Bool {
    return currentUser != nil
  }
}
