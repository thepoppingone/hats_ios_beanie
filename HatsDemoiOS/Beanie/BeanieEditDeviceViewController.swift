//
//  BeanieEditDeviceViewController.swift
//  HatsDemoiOS
//
//  Created by Poh Peng Wang on 6/12/19.
//  Copyright © 2019 TopTier labs. All rights reserved.
//

import UIKit

class BeanieEditDeviceViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {

    @IBOutlet weak var brandPickerView: UIPickerView!
    @IBOutlet weak var osPickerView: UIPickerView!
    @IBOutlet weak var hatsUserGroupSwitch: UISwitch!
    @IBOutlet weak var deviceDatePicker: UIDatePicker!
    @IBOutlet weak var editDeviceButton: UIButton!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var modelTextField: UITextField!

    var deviceId: Int = 0
    var brandPickerData: [String] = [String]()
    var osPickerData: [String] = [String]()
    var selectedBrand: String = ""
    var selectedOS: String = ""
    var inputName: String = ""
    var inputModel: String = ""
    var textFieldEmpty = true
    var selectionEmpty = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.nameTextField.delegate = self
        self.modelTextField.delegate = self
        self.brandPickerView.delegate = self
        self.brandPickerView.dataSource = self
        self.osPickerView.delegate = self
        self.osPickerView.dataSource = self
        
        brandPickerData = ["Samsung", "Apple", "Huawei", "Xiaomi", "Oppo"]
        osPickerData = ["iOS", "Android", "Other OS"]
        
        if let currentDevice = BeanieStore.shared.findDevice(deviceId: deviceId) {
            inputName = currentDevice.name
            self.nameTextField.text = currentDevice.name
            inputModel = currentDevice.model
            self.modelTextField.text = currentDevice.model
//            if let row = self.storeItems.firstIndex(where: {$0.id == deviceId}) {
            selectedBrand = currentDevice.brand
            if let brandIndex = brandPickerData.firstIndex(where: {$0 == currentDevice.brand}) {
               self.brandPickerView.selectRow(brandIndex, inComponent: 0, animated: true)
            }
            selectedOS = currentDevice.operating_system
            if let osIndex = osPickerData.firstIndex(where: {$0 == currentDevice.operating_system}) {
               self.osPickerView.selectRow(osIndex, inComponent: 0, animated: true)
            }
            
            // Add logic for datepicker in the future

        
        }
        // Do any additional setup after loading the view.
    }
    
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
        if textField == nameTextField {
            inputName = textField.text!
        } else if textField == modelTextField {
            inputModel = textField.text!
        }
        
        if !inputName.isEmpty && !inputModel.isEmpty {
            textFieldEmpty = false
        }
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == brandPickerView {
            return brandPickerData.count
        } else if pickerView == osPickerView {
            return osPickerData.count
        }
        
        return 0
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == brandPickerView {
            return brandPickerData[row]
        } else if pickerView == osPickerView {
            return osPickerData[row]
        }
        return "none"
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == brandPickerView {
            selectedBrand = brandPickerData[row]
        } else if pickerView == osPickerView {
            selectedOS = osPickerData[row]
        }
        
        if !selectedBrand.isEmpty && !selectedOS.isEmpty {
            selectionEmpty = false
        }
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
    @IBAction func editDeviceTapped(_ sender: Any) {
        
        BeanieStore.shared.updateDevice(deviceId: deviceId, name: inputName, brand: selectedBrand, model: inputModel, operating_system: selectedOS, user_group: hatsUserGroupSwitch.isOn ? "HATS" : "None", purchase_date: deviceDatePicker.date)
    
//        if let stack = self.navigationController?.viewControllers {
//            if (stack.count > 1) {
//                let previousController = stack[stack.count-2] as! BeanieItemsCollectionViewController
//           previousController.deviceCollectionView.reloadData()
//                //            if let previosController == Beanie
//
//            }
//        }
        
//        self.navigationController?.popViewController(animated: true)
        self.dismiss(animated: true)
        
    }
}
