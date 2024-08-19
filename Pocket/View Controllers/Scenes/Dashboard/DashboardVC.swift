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
    
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var profileName: UILabel!
    @IBOutlet weak var accountName: UIImageView!
    @IBOutlet weak var accountType: UILabel!
    @IBOutlet weak var balanceAmount: UILabel!
    @IBOutlet weak var balanceIcon: UIImageView!
    @IBOutlet weak var balanceLabel: UILabel!
    @IBOutlet weak var notificationIcon: UIImageView!
    @IBOutlet weak var homeTopIcon1: UIImageView!
    @IBOutlet weak var shortcutSuperView: UIView!
    
    @IBOutlet weak var TransactionTableFooterView: UIView!
    @IBOutlet weak var balanceVisibilityButton: UIButton!
    @IBOutlet weak var sideMenuTableViewWidthConstraint: NSLayoutConstraint!
    @IBOutlet weak var sideMenuTableView: UITableView!
    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var listOfServicesCollectionViewHeight: NSLayoutConstraint!
    @IBOutlet weak var listOfServicesCollectionView: UICollectionView!
    
    @IBOutlet weak var shortcutCollectionView: UICollectionView!
    
    @IBOutlet weak var transactionTableViewsHeader: UIView!
    @IBOutlet weak var transactionTableViewHeight: NSLayoutConstraint!
    @IBOutlet weak var transactionTableView: UITableView!
    
    @IBOutlet weak var transactionFooterViewsContentView: UIView!
    
    
    let viewModel = DashboardVM()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.updateServicesNotOnShortcut()
        setupShortcutCollectionView()
        self.bgView.isHidden = true
        self.listOfServicesCollectionViewHeight.constant = 0
        self.listOfServicesCollectionView.center.y = self.view.bounds.maxY
        setUplistOfServicesCollectionView()
        setUpGestureOnShortCut()
        setUpTransactionTableView()
        setUpSideMenuTableView()
        setUpTapGestureForSideMenu()
        setupCornerViews()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.transactionTableViewHeight.constant = self.transactionTableView.contentSize.height
    }
    
    func setupCornerViews(){
        transactionFooterViewsContentView.set(corners: .bottomCorners, radius: 15)
        transactionTableViewsHeader.set(corners: .topCorners, radius: 15)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        //navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    func setUpSideMenuTableView() {
        sideMenuTableView.delegate = self
        sideMenuTableView.dataSource = self
        
        sideMenuTableView.isHidden = true
        sideMenuTableView.register(UINib(nibName: "SettingsTableViewCell", bundle: nil), forCellReuseIdentifier: "SettingsTableViewCell")
        
        sideMenuTableView.register(UINib(nibName: "ProfileTableViewCell", bundle: nil), forCellReuseIdentifier: "ProfileTableViewCell")
        
        sideMenuTableView.center.x -= self.view.bounds.width
        sideMenuTableViewWidthConstraint.constant = 0
    }
    
    func setUpTapGestureForSideMenu() {
        let tapGestureOnAccountImage = UITapGestureRecognizer(target: self, action: #selector(tapGestureForSideMenuHandler(_:)))
        accountName.addGestureRecognizer(tapGestureOnAccountImage)
    }
    
    @objc func tapGestureForSideMenuHandler(_ sender: Any ){
        animateSideMenuTableView()
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
    
//    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
//        listOfServicesCollectionView.layer.removeAllAnimations()
//        listOfServicesCollectionViewHeight.constant = listOfServicesCollectionView.contentSize.height
//        UIView.animate(withDuration: 0.5) {
//            self.updateViewConstraints()
//        }
//
//    }
    
    func setUpTransactionTableView(){
        transactionTableView.delegate = self
        transactionTableView.dataSource = self
        
        let nib = UINib(nibName: "transactionsTableViewCell", bundle: nil)
        transactionTableView.register(nib, forCellReuseIdentifier: "transactionsTableViewCell")
        transactionTableView.register(UINib(nibName: "FooterTransactionTableViewCell", bundle: nil), forCellReuseIdentifier: "FooterTransactionTableViewCell")
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
                            self.viewModel.updateServicesNotOnShortcut()
                            self.listOfServicesCollectionView.reloadData()
                            cellAtIndexPath.removeButton.isHidden = true
                        }), for: .touchUpInside)
                    }
                    
                }
            }
        }
    }
    
    @IBAction func tapGestureToDisableBGView(_ sender: Any) {
        print("tap on bgView")
        dismissSideMenuTableView()
        dismissListOfServicesCollectionView()
    }
        
    @IBAction func balanceVisibilityToggle(_ sender: Any) {
        
        if viewModel.balanceIsHidden == true {
            DispatchQueue.main.async {
                self.showBalanceLoader()
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0){
                self.stopBalanceLoader()
                self.showBalance()
                self.viewModel.balanceIsHidden.toggle()
                self.balanceWillAutoHide()
            }
           
        }else {
            
            hideBalance()
            viewModel.balanceIsHidden.toggle()
        }

        
    }
    
    func showBalance(){
        balanceVisibilityButton.setImage(UIImage(named: "eyehidden"), for: .normal)
        self.balanceAmount.text = "4,00,000"
    }
    
    func hideBalance(){
        balanceVisibilityButton.setImage(UIImage(named: "eyeopen"), for: .normal)
        balanceAmount.text = "*******"
    }
    
    func showBalanceLoader(){
        balanceVisibilityButton.setImage(UIImage(named: "refresh"), for: .normal)
        let rotationAnimation = CABasicAnimation(keyPath: "transform.rotation")
        rotationAnimation.toValue = Double.pi * 2
        rotationAnimation.duration = 1
        balanceVisibilityButton.layer.add(rotationAnimation, forKey: "balanceLoader")
    }
    
    func stopBalanceLoader(){
        if balanceVisibilityButton.layer.animation(forKey: "balanceLoader") != nil {
            balanceVisibilityButton.layer.removeAnimation(forKey: "balanceLoader")
        }
        
    }
    
    func balanceWillAutoHide(){
        if viewModel.balanceIsHidden == false {
            DispatchQueue.main.asyncAfter(deadline: .now() + 3.0){
                self.hideBalance()
                self.viewModel.balanceIsHidden.toggle()
            }
        }
    }
    
}

extension UIView {
    func startRotate() {
        let rotate = CAKeyframeAnimation(keyPath: "transform.rotation")
        rotate.values = [-2 , -1, 1]
        rotate.autoreverses = false
        layer.add(rotate, forKey: "rotate")
    }
    func stopWiggle() {
        self.layer.removeAnimation(forKey: "rotate")
    }
    
}

extension DashboardVC {
    func animateListOfServicesCollectionView(){
        listOfServicesCollectionView.reloadData()
        UIView.animate(withDuration: 0.5) {
            
            self.bgView.isHidden = false
            self.bgView.backgroundColor = .black
            self.bgView.alpha = 0.3
            print("Total height: \(self.view.bounds.height), midPoint: \(self.view.bounds.midY)")
            self.listOfServicesCollectionView.center.y = self.view.bounds.midY
            self.listOfServicesCollectionViewHeight.constant = self.view.bounds.height / 1.50
            
        }
    }
    func animateSideMenuTableView(){
        UIView.animate(withDuration: 0.4) {
            
            self.bgView.isHidden = false
            self.bgView.backgroundColor = .black
            self.bgView.alpha = 0.3
            
            self.sideMenuTableView.isHidden = false
            // change the animation
            self.sideMenuTableView.center.x = self.view.center.x
            //
            self.sideMenuTableViewWidthConstraint.constant = self.view.bounds.width / 1.25
            
            print("side menu center = \(self.sideMenuTableView.center.x) and width = \(self.sideMenuTableViewWidthConstraint.constant)")
        }
    }
    func dismissSideMenuTableView(){
        UIView.animate(withDuration: 0.3) {
            
            self.sideMenuTableView.center.x -= self.view.bounds.width
            self.sideMenuTableViewWidthConstraint.constant = 0
            self.bgView.alpha = 0
            self.bgView.isHidden = true
            self.sideMenuTableView.isHidden = true
        }
    }
    func dismissListOfServicesCollectionView(){
        UIView.animate(withDuration: 0.5) {
            
            self.bgView.alpha = 0
            self.bgView.isHidden = true
            self.listOfServicesCollectionView.center.y = self.view.bounds.maxY
            self.listOfServicesCollectionViewHeight.constant = 0
        }
    }
    
}

