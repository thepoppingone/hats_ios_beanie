//
//  BeanieNewDeviceViewController.swift
//  HatsDemoiOS
//
//  Created by Poh Peng Wang on 4/12/19.
//  Copyright © 2019 TopTier labs. All rights reserved.
//

import UIKit

class BeanieNewDeviceViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {
    
    @IBOutlet weak var brandPickerView: UIPickerView!
    @IBOutlet weak var osPickerView: UIPickerView!
    @IBOutlet weak var hatsUserGroupSwitch: UISwitch!
    @IBOutlet weak var deviceDatePicker: UIDatePicker!
    @IBOutlet weak var addDeviceBtn: UIButton!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var modelTextField: UITextField!
    
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
        
        if !textFieldEmpty && !selectionEmpty {
            addDeviceBtn.isEnabled = true
            addDeviceBtn.backgroundColor = UIColor.blue
        } else {
            addDeviceBtn.isEnabled = false
            addDeviceBtn.backgroundColor = UIColor.gray
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
        
        if !textFieldEmpty && !selectionEmpty {
            addDeviceBtn.isEnabled = true
            addDeviceBtn.backgroundColor = UIColor.blue
        } else {
            addDeviceBtn.isEnabled = false
            addDeviceBtn.backgroundColor = UIColor.gray
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
    
    @IBAction func addDeviceTapped(_ sender: Any) {
        
        let newDevice = BeanieDevice(id: BeanieStore.shared.storeItems.count + 1, name: inputName, brand: selectedBrand, model: inputModel, operating_system: selectedOS, user_group: hatsUserGroupSwitch.isOn ? "HATS" : "None" , purchase_date: deviceDatePicker.date)
        
        BeanieStore.shared.addNewDevice(device: newDevice)
        if let stack = self.navigationController?.viewControllers {
            if (stack.count > 1) {
                let previousController = stack[stack.count-2] as! BeanieItemsCollectionViewController
                previousController.deviceCollectionView.reloadData()
                //            if let previosController == Beanie
                
            }
        }
        
        self.navigationController?.popViewController(animated: true)
        
    }
}
