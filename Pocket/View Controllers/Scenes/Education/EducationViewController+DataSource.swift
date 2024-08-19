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
//        cell.bgView.backgroundColor = .black
        return cell
    }
    
    
}
extension EducationViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let selectedIndex = educationViewModel.selectedIndexOnCategoryCollectionView {
            categories[selectedIndex.row].institutions.count
        }
        else {
            3
        }
        //3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "RecentTableViewCell") as! RecentTableViewCell
            cell.iconView.layer.borderColor = UIColor.lightGray.cgColor
            cell.iconView.set(corners: [.bottomCorners, .topCorners], radius: 5)
            cell.iconView.clipsToBounds = true

            if let selectedIndex = educationViewModel.selectedIndexOnCategoryCollectionView {
                let selectedCategory = categories[selectedIndex.row]
                let institution = selectedCategory.institutions[indexPath.row]
                cell.iconView.image = UIImage(named: institution.logo)
                cell.name.text = institution.name
            } else {
                let defaultCategory = categories[3]
                let institution = defaultCategory.institutions[indexPath.row]
                cell.iconView.image = UIImage(named: institution.logo)
                cell.name.text = institution.name
            }
            return cell
        
    }
    
    
}
