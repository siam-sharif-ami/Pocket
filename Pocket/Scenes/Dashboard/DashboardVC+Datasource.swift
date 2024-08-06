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
        
//        let columns: CGFloat = 4
//        let collectionViewWidth = collectionView.bounds.width
//        let flowLayout = collectionViewLayout as! UICollectionViewFlowLayout
//        let spaceBetweenCells = flowLayout.minimumInteritemSpacing * (columns - 1)
//        let adjustedWidth = collectionViewWidth - spaceBetweenCells
        let width: CGFloat = 65 /*adjustedWidth / columns*/
        let height: CGFloat = 90
        return CGSize(width: width, height: height)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        if collectionView == self.listOfServicesCollectionView {
            return UIEdgeInsets(top: 5, left: 15, bottom: 5, right: 15)
        }else {
            return UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
        }
    }
}

extension DashboardVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        transactionsOnTableView.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
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
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Transactions"
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        10
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        60
    }
}
