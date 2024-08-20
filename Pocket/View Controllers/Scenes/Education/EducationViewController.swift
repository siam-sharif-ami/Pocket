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
    
    @IBOutlet weak var bgView: UIView!
    
    @IBOutlet weak var navBar: NavBarWithBackButton!
    
    @IBOutlet weak var recentView: UIView!
    
    @IBOutlet weak var recentTableView: UITableView!
    
    @IBOutlet weak var institutionCategoryLabel: UILabel!
    @IBOutlet weak var recentTableViewHeight: NSLayoutConstraint!
    
    @IBOutlet weak var institutionCategoryCollectionViewHeight: NSLayoutConstraint!
    
    var educationViewModel = EducationViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        setUpInstitutionCategoryCollectionView()
        customizeCornerViews()
        customizeRecentTableView()
        setupNavBar()
        setupTextFieldSearching()
        self.recentTableView.addObserver(self, forKeyPath: "contentSize", options: NSKeyValueObservingOptions.new, context: nil)
        self.institutionCategoryCollectionView.addObserver(self, forKeyPath: "contentSize", context: nil)
        
    }
    
    func setupTextFieldSearching(){
        searchTextField.addTarget(self, action: #selector(search(_:)), for: .editingChanged)
    }
    
    @objc func search(_ textField: UITextField ) {
        educationViewModel.selectedIndexOnCategoryCollectionView = nil
        if let text = textField.text {
            educationViewModel.search(text)
            educationViewModel.matchingInstitutions(matchingCategories: educationViewModel.matchedCategories)
            institutionCategoryCollectionView.reloadData()
            recentTableView.reloadData()
        }else {
            // default values in category collection view
            educationViewModel.matchedCategories = categories
            educationViewModel.matchedInstitutions = categories.flatMap{ $0.institutions }
        }
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        institutionCategoryCollectionView.layer.removeAllAnimations()
        recentTableView.layer.removeAllAnimations()
        
        institutionCategoryCollectionViewHeight.constant = institutionCategoryCollectionView.contentSize.height
        recentTableViewHeight.constant = recentTableView.contentSize.height
        UIView.animate(withDuration: 0.5) {
            self.updateViewConstraints()
        }

    }
    
    deinit {
        self.recentTableView.removeObserver(self, forKeyPath: "contentSize")
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
       
        self.recentView.set(corners: .topCorners, radius: 12)
        self.recentTableView.set(corners: .bottomCorners, radius: 12)
    }

    
    func setUpInstitutionCategoryCollectionView(){
        institutionCategoryCollectionView.delegate = self
        institutionCategoryCollectionView.dataSource = self
        
        
        /// set the height to contentSize
        
        
        institutionCategoryCollectionView.register(UINib(nibName: "InstitutionCategoryCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "InstitutionCategoryCollectionViewCell")
        
        
    }
}
