//
//  DashboardVC.swift
//  Pocket
//
//  Created by BS00484 on 29/7/24.
//

import Foundation
import UIKit



class DashboardVC: UIViewController {
    
    @IBOutlet weak var backgroundImage: UIImageView!
    
    @IBOutlet weak var profileName: UILabel!
    @IBOutlet weak var accountName: UIImageView!
    @IBOutlet weak var accountType: UILabel!
    
    @IBOutlet weak var balanceVisibleIcon: UIImageView!
    @IBOutlet weak var balanceAmount: UILabel!
    @IBOutlet weak var balanceIcon: UIImageView!
    @IBOutlet weak var balanceLabel: UILabel!
    @IBOutlet weak var notificationIcon: UIImageView!
    @IBOutlet weak var homeTopIcon1: UIImageView!
    @IBOutlet weak var shortcutSuperView: UIView!
    
    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var listOfServicesCollectionViewHeight: NSLayoutConstraint!
    @IBOutlet weak var listOfServicesCollectionView: UICollectionView!
    
    @IBOutlet weak var shortcutCollectionView: UICollectionView!
    
    var servicesNotOnShortcut: [Service] = []
    var selectedShortcutIndex: IndexPath?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        backgroundImage.image = UIImage(named: "Full Screen")
        updateServicesNotOnShortcut()
        setupShortcutCollectionView()
        self.listOfServicesCollectionViewHeight.constant = 0
        self.listOfServicesCollectionView.center.y = self.view.bounds.maxY
        setUplistOfServicesCollectionView()
        
    }
    func setupShortcutCollectionView(){
        
        shortcutCollectionView.delegate = self
        shortcutCollectionView.dataSource = self
        
        let nib = UINib(nibName: "shortcutCollectionViewCell", bundle: nil)
        shortcutCollectionView.register(nib, forCellWithReuseIdentifier: "shortcutCollectionViewCell")
        
    }
    
    func setUplistOfServicesCollectionView(){
        
        listOfServicesCollectionView.delegate = self
        listOfServicesCollectionView.dataSource = self
        let nib = UINib(nibName: "listOfServicesCollectionViewCell", bundle: nil)
        listOfServicesCollectionView.register(nib, forCellWithReuseIdentifier: "listOfServicesCollectionViewCell")
    }
    
    @IBAction func tapGestureToDisableBGView(_ sender: Any) {
        dismissListOfServicesCollectionView()
    }
    
}

extension UIView {
    func startWiggle() {
        let wiggle = CAKeyframeAnimation(keyPath: "transform.rotation")
        wiggle.values = [-0.1, 0.1, -0.1]
        wiggle.autoreverses = true
        wiggle.duration = 0.1
        wiggle.repeatCount = Float.infinity
        layer.add(wiggle, forKey: "wiggle")
    }
    func stopWiggle() {
        self.layer.removeAnimation(forKey: "wiggle")
    }
    
}

extension DashboardVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.shortcutCollectionView {
            return servicesOnShortcut.count
        }else {
            /// listOfServicesCollectionView
            return servicesNotOnShortcut.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.shortcutCollectionView{
            let cell = shortcutCollectionView.dequeueReusableCell(withReuseIdentifier: "shortcutCollectionViewCell", for: indexPath) as! shortcutCollectionViewCell
            cell.shortcutLabel.text = servicesOnShortcut[indexPath.row].title
            cell.shortcutImageView.image = UIImage(named: "\(servicesOnShortcut[indexPath.row].icon)")
            return cell
        }else  {
            /// listOfServicesCollectionView
            
            let cell = listOfServicesCollectionView.dequeueReusableCell(withReuseIdentifier: "listOfServicesCollectionViewCell", for: indexPath) as! listOfServicesCollectionViewCell
            cell.title.text = servicesNotOnShortcut[indexPath.row].title
            cell.icon.image = UIImage(named: servicesNotOnShortcut[indexPath.row].icon)
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let columns: CGFloat = 4
        let collectionViewWidth = collectionView.bounds.width
        let flowLayout = collectionViewLayout as! UICollectionViewFlowLayout
        let spaceBetweenCells = flowLayout.minimumInteritemSpacing * (columns - 1)
        let adjustedWidth = collectionViewWidth - spaceBetweenCells
        let width: CGFloat = adjustedWidth / columns
        let height: CGFloat = 90
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == self.shortcutCollectionView {
            
            selectedShortcutIndex = indexPath
            animateListOfServicesCollectionView()
            
            
        }else {
            /// listOfServicesCollectionView
            ///
            if let selectedShortcutIndex  = self.selectedShortcutIndex {
                let selectedService = servicesNotOnShortcut[indexPath.row]
                
                // update servicesOnShortcut
                servicesOnShortcut[selectedShortcutIndex.row] = selectedService
                
                // update the cell on shortcut
                let selectedShortcut = shortcutCollectionView.cellForItem(at: selectedShortcutIndex) as! shortcutCollectionViewCell
                selectedShortcut.shortcutImageView.image = UIImage(named: "\(selectedService.icon)")
                selectedShortcut.shortcutLabel.text = selectedService.title
                
                updateServicesNotOnShortcut()
                dismissListOfServicesCollectionView()
            }
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        if collectionView == self.listOfServicesCollectionView {
            return UIEdgeInsets(top: 5, left: 15, bottom: 5, right: 15)
        }else {
            return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        }
    }
    
}
extension DashboardVC {
    func animateListOfServicesCollectionView(){
        listOfServicesCollectionView.reloadData()
        UIView.animate(withDuration: 0.5) {
            
            self.bgView.backgroundColor = .black
            self.bgView.alpha = 0.3
            self.listOfServicesCollectionView.center.y = self.view.bounds.midY
            self.listOfServicesCollectionViewHeight.constant = self.view.bounds.height / 2
            
            
        }
    }
    func dismissListOfServicesCollectionView(){
        UIView.animate(withDuration: 0.5) {
            
            self.bgView.alpha = 0
            self.listOfServicesCollectionView.center.y = self.view.bounds.maxY
            self.listOfServicesCollectionViewHeight.constant = 0
        }
    }
    func updateServicesNotOnShortcut() {
        
        servicesNotOnShortcut = listOfServices.filter { service in
            !servicesOnShortcut.contains { $0.title == service.title }
        }
    }
}

