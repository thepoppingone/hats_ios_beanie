//
//  SignUpViewController.swift
//  HatsDemoiOS
//
//  Created by Rootstrap on 5/22/17.
//  Copyright © 2017 Rootstrap. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {
  
  // MARK: - Outlets
  
  @IBOutlet weak var signUp: UIButton!
  @IBOutlet weak var emailField: UITextField!
  @IBOutlet weak var passwordField: UITextField!
  @IBOutlet weak var passwordConfirmationField: UITextField!
  @IBOutlet weak var registerLoadingView: UIView!
  @IBOutlet weak var registerStatusLabel: UILabel!
    
  var viewModel: SignUpViewModelWithEmail!
  
  // MARK: - Lifecycle Events
  
  override func viewDidLoad() {
    super.viewDidLoad()
    signUp.setRoundBorders(22)
    viewModel.delegate = self
    setSignUpButton(enabled: false)
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    navigationController?.setNavigationBarHidden(false, animated: true)
  }
  
  // MARK: - Actions
    @IBAction func cancelTouched(_ sender: Any) {
        registerLoadingView.alpha = 0
    }
    
  @IBAction func formEditingChange(_ sender: UITextField) {
    let newValue = sender.text ?? ""
    switch sender {
    case emailField:
      viewModel.email = newValue
    case passwordField:
      viewModel.password = newValue
    case passwordConfirmationField:
      viewModel.passwordConfirmation = newValue
    default: break
    }
  }
  
  @IBAction func tapOnSignUpButton(_ sender: Any) {
    viewModel.signup()
    registerStatusLabel.text = "Registering User..."
    registerLoadingView.alpha = 0.9
  }
  
  func setSignUpButton(enabled: Bool) {
    signUp.alpha = enabled ? 1 : 0.5
    signUp.isEnable = enabled
  }
}

extension SignUpViewController: SignUpViewModelDelegate {
  func formDidChange() {
    setSignUpButton(enabled: viewModel.hasValidData)
  }
  
  func didUpdateState() {
    switch viewModel.state {
    case .loading:
      UIApplication.showNetworkActivity()
    case .error(let errorDescription):
      UIApplication.hideNetworkActivity()
//      showMessage(title: "Error", message: errorDescription)
      registerStatusLabel.text = "Error: "+errorDescription
    case .idle:
      registerLoadingView.alpha = 0.0
      UIApplication.hideNetworkActivity()
    }
  }
}
