//
//  UIApplicationExtension.swift
//  HatsDemoiOS
//
//  Created by Agustina Chaer on 24/10/17.
//  Copyright © 2017 Rootstrap. All rights reserved.
//

import Foundation
import UIKit

extension UIApplication {
  class func showNetworkActivity() {
    UIApplication.shared.isNetworkActivityIndicatorVisible = true
  }
  
  class func hideNetworkActivity() {
    UIApplication.shared.isNetworkActivityIndicatorVisible = false
  }
}
