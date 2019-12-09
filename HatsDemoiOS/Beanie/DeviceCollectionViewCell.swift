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
    
    @IBAction func deleteTouched(_ sender: Any) {
        
        var deleteAlert = UIAlertController(title: "Delete this device", message: "Are You Sure to Delete? ", preferredStyle: UIAlertController.Style.alert)

        deleteAlert.addAction(UIAlertAction(title: "Confirm", style: .default, handler: { (action: UIAlertAction!) in
//            BeanieStore.shared.currentVC.navigationController?.popToRootViewController(animated: true)
            BeanieStore.shared.removeDevice(deviceId: Int(self.deviceId.text!)!)
        }))
//
        deleteAlert.addAction(UIAlertAction(title: "Cancel", style: .default, handler: { (action: UIAlertAction!) in
            deleteAlert.dismiss(animated: true, completion: nil)
        }))
        
        BeanieStore.shared.currentVC.present(deleteAlert, animated: true, completion: nil)
        
    }
    
    @IBAction func editTouched(_ sender: Any) {
        let deviceIDEditing = Int(self.deviceId.text!)
        if let editDeviceVC = UIStoryboard(name: "BeanieHome", bundle: nil).instantiateViewController(withIdentifier: "editDeviceVC") as? BeanieEditDeviceViewController {
            editDeviceVC.deviceId = deviceIDEditing!
            BeanieStore.shared.currentVC.present(editDeviceVC, animated: true)
        }
    }
    
}
