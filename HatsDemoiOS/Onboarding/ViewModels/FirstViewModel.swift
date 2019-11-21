//
//  FirstViewModel.swift
//  HatsDemoiOS
//
//  Created by German Stabile on 11/2/18.
//  Copyright © 2018 TopTier labs. All rights reserved.
//

import Foundation

protocol FirstViewModelDelegate: class {
  func didUpdateState()
  func didUpdateCredentials()
}

class FirstViewModel {
  
  var state: ViewModelState = .idle {
    didSet {
      delegate?.didUpdateState()
    }
  }
  
  weak var delegate: FirstViewModelDelegate?
    
  var email = "" {
    didSet {
      delegate?.didUpdateCredentials()
    }
  }
    
  var password = "" {
    didSet {
      delegate?.didUpdateCredentials()
    }
  }
    
  func signIn() {
//    AppNavigator.shared.navigate(to: OnboardingRoutes.signIn, with: .push)
    self.login()
  }

  func signUp() {
    AppNavigator.shared.navigate(to: OnboardingRoutes.signUp, with: .push)
  }
    
  var hasValidCredentials: Bool {
    return email.isEmailFormatted() && !password.isEmpty
  }
  
  func login() {
    state = .loading
    UserService.sharedInstance
      .login(email,
             password: password,
             success: { [weak self] in
              guard let self = self else { return }
              self.state = .idle
              AnalyticsManager.shared.identifyUser(with: self.email)
              AnalyticsManager.shared.log(event: Event.login)
              AppNavigator.shared.navigate(to: HomeRoutes.home, with: .changeRoot)
             },
             failure: { [weak self] error in
               self?.state = .error(error.localizedDescription)
             })
  }
  
 }

