//
//  DashboardVC+Datasource.swift
//  Pocket
//
//  Created by BS00484 on 4/8/24.
//

import Foundation
import UIKit

extension DashboardVC: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == self.shortcutCollectionView {
            
            selectedShortcutIndex = indexPath
            let cell = shortcutCollectionView.cellForItem(at: indexPath) as! shortcutCollectionViewCell
            if cell.removeButton.isHidden == true {
                animateListOfServicesCollectionView()
            }
            
            
        }else {
            /// listOfServicesCollectionView
            ///
            if let selectedShortcutIndex  = self.selectedShortcutIndex {
                let selectedService = servicesNotOnShortcut[indexPath.row]
                
                // update servicesOnShortcut Model
                servicesOnShortcut[selectedShortcutIndex.row] = selectedService
                //
                
                // update the cell on shortcut
                let selectedShortcut = shortcutCollectionView.cellForItem(at: selectedShortcutIndex) as! shortcutCollectionViewCell
                selectedShortcut.shortcutImageView.image = UIImage(named: "\(selectedService.icon)")
                selectedShortcut.shortcutLabel.text = selectedService.title
                selectedShortcut.shortcutPlusImage.isHidden = true
                
                updateServicesNotOnShortcut()
                dismissListOfServicesCollectionView()
            }
        }
    }
}

extension DashboardVC: UITableViewDelegate {
    
}
