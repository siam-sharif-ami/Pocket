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
        3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RecentTableViewCell") as! RecentTableViewCell
        cell.iconView.image = UIImage(named: categories[0].logo)
        cell.name.text = categories[0].name
        return cell
    }
    
    
}
