//
//  DashboardVC+Delegate.swift
//  Pocket
//
//  Created by BS00484 on 4/8/24.
//

import Foundation
import UIKit

extension DashboardVC: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
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
            cell.shortcutImageView.image = UIImage(named: "\(servicesOnShortcut[indexPath.row].icon)")
            cell.shortcutLabel.text = servicesOnShortcut[indexPath.row].title
            cell.removeButton.isHidden = true
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
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        if collectionView == self.listOfServicesCollectionView {
            return UIEdgeInsets(top: 5, left: 15, bottom: 5, right: 15)
        }else {
            return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        }
    }
}
