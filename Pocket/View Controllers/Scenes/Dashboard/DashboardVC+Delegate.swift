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
            guard let cell = shortcutCollectionView.cellForItem(at: indexPath) as? shortcutCollectionViewCell else { return }
            if cell.removeButton.isHidden == true  && cell.shortcutLabel.text == "Shortcut" {
                animateListOfServicesCollectionView()
            }else if cell.shortcutLabel.text == "Payment" {
                guard let controller = storyboard?.instantiateViewController(withIdentifier: "EducationViewController") as? EducationViewController
                else { return }
                navigationController?.pushViewController(controller, animated: true)
            }
            else {
                guard let controller = storyboard?.instantiateViewController(withIdentifier: "testViewController") as? testViewController
                else { return }
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
