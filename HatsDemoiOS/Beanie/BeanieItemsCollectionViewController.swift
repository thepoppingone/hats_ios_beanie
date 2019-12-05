//
//  BeanieItemsCollectionViewController.swift
//  HatsDemoiOS
//
//  Created by Poh Peng Wang on 28/11/19.
//  Copyright © 2019 TopTier labs. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class BeanieItemsCollectionViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    let device1 = BeanieDevice(id: 1, name: "Ric's iPhone", brand: "Apple", model: "iPhone 7 Plus", operating_system: "iOS", user_group: "HATS", purchase_date: Date())
    let device2 = BeanieDevice(id: 2, name: "Ric's Pixel", brand: "Google", model: "Pixel 3a", operating_system: "Android", user_group: "HATS", purchase_date: Date())
    let device3 = BeanieDevice(id: 3, name: "Ric's Galaxy", brand: "Samsung", model: "Galaxy S10e", operating_system: "Android", user_group: "HATS", purchase_date: Date())
    let device4 = BeanieDevice(id: 4, name: "Ric's Mate 30", brand: "Huawei", model: "Mate 30 Pro", operating_system: "Android", user_group: "HATS", purchase_date: Date())
    let device5 = BeanieDevice(id: 5, name: "Ric's A2", brand: "Xiaomi", model: "A2", operating_system: "Android", user_group: "HATS", purchase_date: Date())
    
    var sampleData: [BeanieDevice] = [];
    @IBOutlet weak var deviceCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        sampleData.append(device1);
        sampleData.append(device2);
        sampleData.append(device3);
        sampleData.append(device4);
        sampleData.append(device5);
        super.viewDidLoad()
//        self.navigationController.navigationBar.hidden = false;

        self.navigationController?.setNavigationBarHidden(false, animated: true)

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        deviceCollectionView.delegate = self
        deviceCollectionView.dataSource = self
//        deviceCollectionView.register(DeviceCollectionViewCell.self, forCellWithReuseIdentifier: "deviceCell")

        // Do any additional setup after loading the view.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return sampleData.count
//        return 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "deviceCell", for: indexPath) as! DeviceCollectionViewCell
    
        let device = sampleData[indexPath.row] as BeanieDevice
        cell.deviceId.text = String(device.id)
        cell.deviceName.text = device.name
        cell.deviceBrand.text = device.brand
        
        // Configure the cell
     
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
            
        return 4
    }
        
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAtIndex section: Int) -> CGFloat {
            
        return 1
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
