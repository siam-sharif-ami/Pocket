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
    
    @IBOutlet weak var recentView: UIView!
    
    var educationViewModel = EducationViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        customizeReceiptButton()
        setUpInstitutionCategoryCollectionView()
        customizeRecentView()
    }
    
    override func viewDidLayoutSubviews() {
    }
    
    func customizeRecentView(){
        recentView.set(corners: [.topCorners, .bottomCorners] , radius: 15)
    }
    
    func customizeReceiptButton(){
        viewReceiptButton.layer.cornerRadius = 10
        viewReceiptButton.applyGradient(colours: [UIColor.white ,
                                                  UIColor.systemYellow,
                                                  UIColor.black] )
        viewReceiptButton.clipsToBounds = true
    }
    
    func setUpInstitutionCategoryCollectionView(){
        institutionCategoryCollectionView.delegate = self
        institutionCategoryCollectionView.dataSource = self
        
        institutionCategoryCollectionView.register(UINib(nibName: "InstitutionCategoryCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "InstitutionCategoryCollectionViewCell")
        
        
    }
}
