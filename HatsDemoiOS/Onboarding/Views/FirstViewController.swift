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
  @IBOutlet weak var signIn: UIButton!
  @IBOutlet weak var signUp: UIButton!
  
  var viewModel: FirstViewModel!

  // MARK: - Lifecycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    viewModel.delegate = self
    [signIn].forEach({ $0?.setRoundBorders(22) })
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    navigationController?.setNavigationBarHidden(true, animated: true)
  }

  // MARK: - Actions
  @IBAction func signInTapped() {
    viewModel.signIn()
  }

  @IBAction func signUpTapped() {
    viewModel.signUp()
  }
}

extension FirstViewController: FirstViewModelDelegate {
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
