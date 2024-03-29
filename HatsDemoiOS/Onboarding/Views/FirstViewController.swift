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
  @IBOutlet weak var signInLoadingView: UIView!
  @IBOutlet weak var signInStatusText: UILabel!
  
  var viewModel: FirstViewModel!
//  var signInViewModel: SignInViewModelWithCredentials!

  
  @IBAction func cancelTouched(_ sender: Any) {
    signInLoadingView.alpha = 0
  }
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
    signInStatusText.text = "Logging in "+viewModel.email+" ..."
    signInLoadingView.alpha = 0.9
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
      signInLoadingView.alpha = 0.0
    case .error(let errorDescription):
      UIApplication.hideNetworkActivity()
//      showMessage(title: "Oops", message: errorDescription)
      signInStatusText.text = "Error: "+errorDescription
    }
  }
}
