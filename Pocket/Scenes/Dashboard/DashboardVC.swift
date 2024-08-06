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
    
    @IBOutlet weak var transactionTableView: UITableView!
    
    
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
        setUpGestureOnShortCut()
        setUpTransactionTableView()
       
    }
    
    func setUpGestureOnShortCut(){
        let longPressGestureOnShortcutCollectionView = UILongPressGestureRecognizer(target: self, action: #selector(handleLongPressOnShortcutCollectionView(_:)))
        longPressGestureOnShortcutCollectionView.minimumPressDuration = 1.0
        shortcutCollectionView.addGestureRecognizer(longPressGestureOnShortcutCollectionView)
        
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
    
    func setUpTransactionTableView(){
        transactionTableView.delegate = self
        transactionTableView.dataSource = self
        
        let nib = UINib(nibName: "transactionsTableViewCell", bundle: nil)
        transactionTableView.register(nib, forCellReuseIdentifier: "transactionsTableViewCell")
    }
    
    @objc func handleLongPressOnShortcutCollectionView(_ sender: UILongPressGestureRecognizer){
        
        if sender.state == .began {
            let location = sender.location(in: shortcutCollectionView)
            if let indexPath = shortcutCollectionView.indexPathForItem(at: location){
                let cellAtIndexPath = shortcutCollectionView.cellForItem(at: indexPath) as! shortcutCollectionViewCell
                if cellAtIndexPath.shortcutLabel.text != "Shortcut" {
                    cellAtIndexPath.removeButton.isHidden = false
                    
                    UIView.animate(withDuration: 0.3) {
                        cellAtIndexPath.removeButton.addAction(UIAction(handler: { _ in
                            
                            /// update on servicesOnShortcut model
                            servicesOnShortcut[indexPath.row].title = "Shortcut"
                            ///
                            
                            cellAtIndexPath.shortcutLabel.text = "Shortcut"
                            cellAtIndexPath.shortcutImageView.image = nil
                            cellAtIndexPath.shortcutPlusImage.isHidden = false
                            self.updateServicesNotOnShortcut()
                            self.listOfServicesCollectionView.reloadData()
                            cellAtIndexPath.removeButton.isHidden = true
                        }), for: .touchUpInside)
                    }
                    
                }
            }
        }
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

extension DashboardVC {
    func animateListOfServicesCollectionView(){
        listOfServicesCollectionView.reloadData()
        UIView.animate(withDuration: 0.5) {
            
            self.bgView.backgroundColor = .black
            self.bgView.alpha = 0.3
            print("Total height: \(self.view.bounds.height), midPoint: \(self.view.bounds.midY)")
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

