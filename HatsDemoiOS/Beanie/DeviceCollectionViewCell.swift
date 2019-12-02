//
//  DeviceCollectionViewCell.swift
//  HatsDemoiOS
//
//  Created by Poh Peng Wang on 2/12/19.
//  Copyright © 2019 TopTier labs. All rights reserved.
//

import UIKit

class DeviceCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var deviceId: UILabel!
    @IBOutlet weak var deviceName: UILabel!
    @IBOutlet weak var deviceBrand: UILabel!
    @IBOutlet weak var editDevice: UIButton!
    @IBOutlet weak var deleteDevice: UIButton!
    
    override func awakeFromNib() {
         super.awakeFromNib()
         contentView.translatesAutoresizingMaskIntoConstraints = false
         contentView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width).isActive = true
     }
    
}
