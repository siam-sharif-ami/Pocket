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
            return self.viewModel.servicesNotOnShortcut.count
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
            cell.title.text = self.viewModel.servicesNotOnShortcut[indexPath.row].title
            cell.icon.image = UIImage(named: self.viewModel.servicesNotOnShortcut[indexPath.row].icon)
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        //        let columns: CGFloat = 4
        //        let collectionViewWidth = collectionView.bounds.width
        //        let flowLayout = collectionViewLayout as! UICollectionViewFlowLayout
        //        let spaceBetweenCells = flowLayout.minimumInteritemSpacing * (columns - 1)
        //        let adjustedWidth = collectionViewWidth - spaceBetweenCells
        /* let width: CGFloat = 65*/ /*adjustedWidth / columns*/
        let width = collectionView.bounds.width / 4.5
        print(width)
        let height: CGFloat = 90
        return CGSize(width: width, height: height)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        if collectionView == self.listOfServicesCollectionView {
            return UIEdgeInsets(top: 5, left: 10, bottom: 5, right: 10)
        }else {
            return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        }
    }
}

extension DashboardVC: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        switch (tableView){
        case self.sideMenuTableView:
            sideMenuSections.count
        case self.transactionTableView:
            1
        default:
            0
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch(tableView){
        case self.transactionTableView:
            min(3,transactionsOnTableView.count)
        case self.sideMenuTableView:
            
            switch(section){
            case 0:
                sideMenuSections[0][""]!.count
            case 1:
                sideMenuSections[1]["Settings"]!.count
            case 2:
                sideMenuSections[2]["Account Service"]!.count
            case 3:
                sideMenuSections[3]["Support"]!.count
            default:
                0
            }
        default:
            0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch(tableView){
            
        case self.sideMenuTableView:
            
            if indexPath.section == 0 {
                let cell = sideMenuTableView.dequeueReusableCell(withIdentifier: "ProfileTableViewCell", for: indexPath) as! ProfileTableViewCell
                let sectionData = sideMenuSections[indexPath.section][""]!
                cell.profileIcon.image = UIImage(named: sectionData[indexPath.row].icon)
                cell.profileName.text = sectionData[indexPath.row].Title
                return cell
            }else if indexPath.section == 1 {
                let cell = sideMenuTableView.dequeueReusableCell(withIdentifier: "SettingsTableViewCell", for: indexPath) as! SettingsTableViewCell
                let sectionData = sideMenuSections[indexPath.section]["Settings"]!
                cell.icon.image = UIImage(named: sectionData[indexPath.row].icon)
                cell.title.text = sectionData[indexPath.row].Title
                return cell
            }else if indexPath.section == 2 {
                let cell = sideMenuTableView.dequeueReusableCell(withIdentifier: "SettingsTableViewCell", for: indexPath) as! SettingsTableViewCell
                let sectionData = sideMenuSections[indexPath.section]["Account Service"]!
                cell.icon.image = UIImage(named: sectionData[indexPath.row].icon)
                cell.title.text = sectionData[indexPath.row].Title
                return cell
            }
            else {
                let cell = sideMenuTableView.dequeueReusableCell(withIdentifier: "SettingsTableViewCell", for: indexPath) as! SettingsTableViewCell
                let sectionData = sideMenuSections[indexPath.section]["Support"]!
                cell.icon.image = UIImage(named: sectionData[indexPath.row].icon)
                cell.title.text = sectionData[indexPath.row].Title
                return cell
            }
            
        case self.transactionTableView:
            let cell = transactionTableView.dequeueReusableCell(withIdentifier: "transactionsTableViewCell",  for: indexPath) as! transactionsTableViewCell
            cell.icon.image = UIImage(named: transactionsOnTableView[indexPath.row].icon)
            cell.transactionTitle.text = transactionsOnTableView[indexPath.row].title
            cell.transactionTitle.numberOfLines = 0
            cell.amount.text = transactionsOnTableView[indexPath.row].amount.description
            
            cell.date.text = transactionsOnTableView[indexPath.row].date
            let type = transactionsOnTableView[indexPath.row].type
            if type == "debit" {
                cell.takaIcon.image = UIImage(named: "taka")?.withTintColor(.red)
                cell.amount.textColor = .red
                cell.minusOrPlus.textColor = .red
            }else {
                cell.takaIcon.image = UIImage(named: "taka")?.withTintColor(.systemGreen)
                cell.amount.textColor = .systemGreen
                cell.minusOrPlus.textColor = .systemGreen
            }
            return cell
            
        default:
            let defaultCell = UITableViewCell(style: .default, reuseIdentifier: "defaultCell")
            defaultCell.textLabel?.text = "Default Cell"
            return defaultCell
            
        }
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch(tableView){
        case self.sideMenuTableView:
            switch(section){
            case 0:
                return ""
            case 1:
                return "Settings"
            case 2:
                return "Account Service"
            case 3:
                return "Support"
            default:
                return "Default"
            }
        default:
            return nil
        }
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        switch(tableView){
        case self.sideMenuTableView:
            40
        default:
            0
        }
    }
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FooterTransactionTableViewCell") as! FooterTransactionTableViewCell
        cell.contentView.set(corners: .bottomCorners, radius: 15)
        return cell
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if tableView == self.transactionTableView {
            return 40
        }else {
            return 0
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch(tableView){
        case self.transactionTableView:
            60
        case self.sideMenuTableView:
            if indexPath.section == 0 {
                70
            }else {
                50
            }
        default:
            0
        }
    }
}
