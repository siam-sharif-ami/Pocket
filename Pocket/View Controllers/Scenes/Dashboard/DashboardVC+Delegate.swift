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
            
            self.viewModel.selectedShortcutIndex = indexPath
            let cell = shortcutCollectionView.cellForItem(at: indexPath) as! shortcutCollectionViewCell
            if cell.removeButton.isHidden == true  && cell.shortcutLabel.text == "Shortcut" {
                animateListOfServicesCollectionView()
            }else if cell.shortcutLabel.text == "Payment" {
                let controller: EducationViewController
                controller = storyboard?.instantiateViewController(withIdentifier: "EducationViewController") as! EducationViewController
                navigationController?.pushViewController(controller, animated: true)
            }
            else {
                let controller: testViewController
                controller = storyboard?.instantiateViewController(withIdentifier: "testViewController") as! testViewController
                controller.text = cell.shortcutLabel.text ?? "Unknown"
                controller.iconView = cell.shortcutImageView
                navigationController?.pushViewController(controller, animated: true)
            }
            
            
        }else {
            /// listOfServicesCollectionView
            ///
            if let selectedShortcutIndex  = self.viewModel.selectedShortcutIndex {
                let selectedService = self.viewModel.servicesNotOnShortcut[indexPath.row]
                
                // update servicesOnShortcut Model
                servicesOnShortcut[selectedShortcutIndex.row] = selectedService
                //
                
                // update the cell on shortcut
                let selectedShortcut = shortcutCollectionView.cellForItem(at: selectedShortcutIndex) as! shortcutCollectionViewCell
                selectedShortcut.shortcutImageView.image = UIImage(named: "\(selectedService.icon)")
                selectedShortcut.shortcutLabel.text = selectedService.title
                selectedShortcut.shortcutPlusImage.isHidden = true
                
                viewModel.updateServicesNotOnShortcut()
                dismissListOfServicesCollectionView()
            }
        }
    }
}

extension DashboardVC: UITableViewDelegate {
    
}
