//
//  ServiceSelectionViewController.swift
//  Pocket
//
//  Created by BS00484 on 30/7/24.
//

import Foundation
import UIKit

protocol ServiceSelectionDelegate{
    func didSelectService(icon: String, title: String)
}

var notOnShortcutServices: [Service] {
    return listOfServices.filter { !$0.isOn }
}

class ServiceSelectionViewController: UIViewController {
    
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var listOfServicesCollectionView: UICollectionView!
    
    @IBOutlet weak var listOfServicesCollectionViewHeight: NSLayoutConstraint!
    
    @IBOutlet weak var bgView: UIView!
    
    @IBOutlet weak var label: UILabel!
    
    var delegate: ServiceSelectionDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.listOfServicesCollectionViewHeight.constant = 0
        self.listOfServicesCollectionView.center.y = self.view.bounds.maxY
        setUplistOfServicesCollectionView()
    }
    
    func setUplistOfServicesCollectionView(){
        
        listOfServicesCollectionView.delegate = self
        listOfServicesCollectionView.dataSource = self
        let nib = UINib(nibName: "listOfServicesCollectionViewCell", bundle: nil)
        listOfServicesCollectionView.register(nib, forCellWithReuseIdentifier: "listOfServicesCollectionViewCell")
    }
    @IBAction func animateCollectionView(_ sender: Any) {
        
        listOfServicesCollectionView.reloadData()
        UIView.animate(withDuration: 0.5) {
            self.bgView.backgroundColor = .lightGray
            self.listOfServicesCollectionViewHeight.constant = self.view.bounds.height / 2
            self.listOfServicesCollectionView.center.y = self.view.bounds.midY
            
        }
        
    }
    @IBAction func onTapDismissCollectionView(_ sender: Any) {
        UIView.animate(withDuration: 0.5) {
            
            self.bgView.backgroundColor = .clear
            self.listOfServicesCollectionView.center.y = self.view.bounds.maxY
            self.listOfServicesCollectionViewHeight.constant = 0
        }
    }
    
}

extension ServiceSelectionViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return notOnShortcutServices.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = listOfServicesCollectionView.dequeueReusableCell(withReuseIdentifier: "listOfServicesCollectionViewCell", for: indexPath) as! listOfServicesCollectionViewCell
        cell.title.text = notOnShortcutServices[indexPath.row].title
        cell.icon.image = UIImage(named: notOnShortcutServices[indexPath.row].icon)
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedService = listOfServices[indexPath.row]
        delegate?.didSelectService(icon: selectedService.icon, title: selectedService.title)
        button.setImage(UIImage(named: "\(selectedService.icon)"), for: .normal)
        label.text = selectedService.title
        listOfServices.remove(at: indexPath.row)
        
        UIView.animate(withDuration: 0.5) {
            self.bgView.backgroundColor = .clear
            self.listOfServicesCollectionView.center.y = self.view.bounds.maxY
            self.listOfServicesCollectionViewHeight.constant = 0
            
            print(self.listOfServicesCollectionView.center.y)
            
        }
    }
    
}
