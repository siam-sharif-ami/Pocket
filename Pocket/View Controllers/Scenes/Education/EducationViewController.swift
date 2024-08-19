//
//  EducationViewController.swift
//  Pocket
//
//  Created by BS00484 on 15/8/24.
//

import Foundation
import UIKit

class EducationViewController: UIViewController {
    
    @IBOutlet weak var searchView: UIView!
    @IBOutlet weak var searchTextField: UITextField!
    
    @IBOutlet weak var viewReceiptButton: UIButton!
    @IBOutlet weak var institutionCategoryCollectionView: UICollectionView!
    
    
    @IBOutlet weak var navBar: NavBarWithBackButton!
    
    @IBOutlet weak var recentTableViewFooterCornerView: UIView!
    @IBOutlet weak var recentView: UIView!
    
    @IBOutlet weak var recentTableView: UITableView!
    
    @IBOutlet weak var recentTableViewHeight: NSLayoutConstraint!
    
    
    @IBOutlet weak var institutionCategoryView: UIView!
    
    var educationViewModel = EducationViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpInstitutionCategoryCollectionView()
        customizeCornerViews()
        customizeRecentTableView()
        setupNavBar()
    }
    
    override func viewDidLayoutSubviews() {
        self.recentTableViewHeight.constant = self.recentTableView.contentSize.height
        
    }
    
    func setupNavBar(){
        navBar.title = "Education"
        navBar.leftButton.addTarget(self, action: #selector(popOutViewController(_:)), for: .touchUpInside)
    }
    
    @objc func popOutViewController(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    func customizeRecentTableView(){
        
        self.recentTableView.dataSource = self
        self.recentTableView.delegate = self
        
        
        recentTableView.register(UINib(nibName: "RecentTableViewCell", bundle: nil), forCellReuseIdentifier: "RecentTableViewCell")
        
       
        
    
    }
    
    func customizeCornerViews(){
       
        self.institutionCategoryView.set(corners: .topCorners, radius: 12)
        self.recentView.set(corners: .topCorners, radius: 12)
        self.recentTableViewFooterCornerView.set(corners: .bottomCorners, radius: 12)
        
    }

    
    func setUpInstitutionCategoryCollectionView(){
        institutionCategoryCollectionView.delegate = self
        institutionCategoryCollectionView.dataSource = self
        
        
        /// set the height to contentSize
        
        
        institutionCategoryCollectionView.register(UINib(nibName: "InstitutionCategoryCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "InstitutionCategoryCollectionViewCell")
        
        
    }
}
