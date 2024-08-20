//
//  EducationViewController+DataSource.swift
//  Pocket
//
//  Created by BS00484 on 15/8/24.
//

import Foundation
import UIKit

extension EducationViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        self.educationViewModel.matchedCategories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "InstitutionCategoryCollectionViewCell", for: indexPath) as! InstitutionCategoryCollectionViewCell
        cell.categoryName.text = self.educationViewModel.matchedCategories[indexPath.row].name
        cell.icon.image = UIImage(named: self.educationViewModel.matchedCategories[indexPath.row].logo)
        
        if indexPath == educationViewModel.selectedIndexOnCategoryCollectionView {
            cell.bgView.backgroundColor = Helper().gradientMidGolden
        }else {
            cell.bgView.backgroundColor = .white
        }
        return cell
    }
    
    
}
extension EducationViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let selectedIndex = educationViewModel.selectedIndexOnCategoryCollectionView {
            educationViewModel.matchedCategories[selectedIndex.row].institutions.count
        }
        else if !educationViewModel.matchedInstitutions.isEmpty {
           educationViewModel.matchedInstitutions.count
        }else {
            1
        }
        //3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "RecentTableViewCell") as! RecentTableViewCell
            cell.iconView.layer.borderColor = UIColor.lightGray.cgColor
            cell.iconView.set(corners: [.bottomCorners, .topCorners], radius: 5)
            cell.iconView.clipsToBounds = true

            if let selectedIndex = educationViewModel.selectedIndexOnCategoryCollectionView {
                let selectedCategory = educationViewModel.matchedCategories[selectedIndex.row]
                let institution = selectedCategory.institutions[indexPath.row]
                cell.iconView.image = UIImage(named: institution.logo)
                cell.name.text = institution.name
            } else if !educationViewModel.matchedInstitutions.isEmpty {
                let institution = educationViewModel.matchedInstitutions[indexPath.row]
                cell.iconView.image = UIImage(named: institution.logo)
                cell.name.text = institution.name
            }else {
                cell.iconBorderView.isHidden = true
                cell.iconView.isHidden = true
                cell.name.text = "No Institutions Found"
            }
            return cell
        
    }
    
    
}
