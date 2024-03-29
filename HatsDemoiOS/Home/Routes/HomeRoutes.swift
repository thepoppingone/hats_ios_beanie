//
//  HomeRoutes.swift
//  HatsDemoiOS
//
//  Created by Mauricio Cousillas on 6/13/19.
//  Copyright © 2019 TopTier labs. All rights reserved.
//

import Foundation
import UIKit

enum HomeRoutes: Route {
  case home

  var screen: UIViewController {
    switch self {
    case .home:
      guard let home = R.storyboard.main.homeViewController() else {
        return UIViewController()
      }
      home.viewModel = HomeViewModel()
      return home
    }
  }
}
