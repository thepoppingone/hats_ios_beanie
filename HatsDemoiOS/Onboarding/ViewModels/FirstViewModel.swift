//
//  FirstViewModel.swift
//  HatsDemoiOS
//
//  Created by German Stabile on 11/2/18.
//  Copyright © 2018 TopTier labs. All rights reserved.
//

import Foundation
import FBSDKLoginKit

protocol FirstViewModelDelegate: class {
  func didUpdateState()
}

class FirstViewModel {
  
  var state: ViewModelState = .idle {
    didSet {
      delegate?.didUpdateState()
    }
  }
  
  weak var delegate: FirstViewModelDelegate?
  
  func signIn() {
    AppNavigator.shared.navigate(to: OnboardingRoutes.signIn, with: .push)
  }

  func signUp() {
    AppNavigator.shared.navigate(to: OnboardingRoutes.signUp, with: .push)
  }
  
}
