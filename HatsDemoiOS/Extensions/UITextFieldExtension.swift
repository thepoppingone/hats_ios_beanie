//
//  UITextFieldExtension.swift
//  HatsDemoiOS
//
//  Created by German on 9/13/19.
//  Copyright © 2019 TopTier labs. All rights reserved.
//

import UIKit

extension UITextField {
  func setPlaceholder(color: UIColor = .lightGray) {
    attributedPlaceholder = NSAttributedString(
      string: placeholder ?? "",
      attributes: [NSAttributedString.Key.foregroundColor: color]
    )
  }
}
