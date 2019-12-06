//
//  BeanieItemsCollectionViewController.swift
//  HatsDemoiOS
//
//  Created by Poh Peng Wang on 28/11/19.
//  Copyright © 2019 TopTier labs. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

extension Notification.Name {
     static let reload = Notification.Name("reload")
}

class BeanieItemsCollectionViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var deviceCollectionView: UICollectionView!

    override func viewDidLoad() {
        
        BeanieStore.shared.currentVC = self

        NotificationCenter.default.addObserver(self, selector: #selector(notifyReloadData(notification:)), name: .reload, object: nil)
        super.viewDidLoad()
        
        // Set Bar to be shown
        self.navigationController?.setNavigationBarHidden(false, animated: true)

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        deviceCollectionView.delegate = self
        deviceCollectionView.dataSource = self

    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */
    
    @objc func notifyReloadData(notification: NSNotification){
        deviceCollectionView.reloadData()
        deviceCollectionView.layoutSubviews()
    }

    // MARK: UICollectionViewDataSource

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        let activeItems = BeanieStore.shared.storeItems.filter { (BeanieDevice) -> Bool in
            BeanieDevice.isDeleted == false
        }
        
        return activeItems.count
//        return 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "deviceCell", for: indexPath) as! DeviceCollectionViewCell
    
        let activeItems = BeanieStore.shared.storeItems.filter { (BeanieDevice) -> Bool in
            BeanieDevice.isDeleted == false
        }
        
        let device = activeItems[indexPath.row] as BeanieDevice
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
