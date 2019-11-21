//
//  ViewController.swift
//  HatsDemoiOS
//
//  Created by Rootstrap on 15/2/16.
//  Copyright © 2016 Rootstrap. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
  
  // MARK: - Outlets
  @IBOutlet weak var logInButton: UIButton!
  @IBOutlet weak var signUp: UIButton!
  @IBOutlet weak var emailField: UITextField!
  @IBOutlet weak var passwordField: UITextField!
  
  var viewModel: FirstViewModel!
//  var signInViewModel: SignInViewModelWithCredentials!

  // MARK: - Lifecycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    viewModel.delegate = self
    
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    navigationController?.setNavigationBarHidden(true, animated: true)
  }

  // MARK: - Actions
  @IBAction func credentialsChanged(_ sender: UITextField) {
    let newValue = sender.text ?? ""
    switch sender {
    case emailField:
      viewModel.email = newValue
    case passwordField:
      viewModel.password = newValue
    default: break
    }
  }
  
  @IBAction func signInTapped() {
    viewModel.login()
  }

  @IBAction func signUpTapped() {
    viewModel.signUp()
  }
  
  func setLoginButton(enabled: Bool) {
    logInButton.alpha = enabled ? 1 : 0.5
    logInButton.isEnabled = enabled
  }
}

extension FirstViewController: FirstViewModelDelegate {
  func didUpdateCredentials() {
    setLoginButton(enabled: viewModel.hasValidCredentials)
  }
  
  func didUpdateState() {
    switch viewModel.state {
    case .loading:
      UIApplication.showNetworkActivity()
    case .idle:
      UIApplication.hideNetworkActivity()
    case .error(let errorDescription):
      UIApplication.hideNetworkActivity()
      showMessage(title: "Oops", message: errorDescription)
    }
  }
}
