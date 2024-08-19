//
//  testViewController.swift
//  Pocket
//
//  Created by BS00484 on 18/8/24.
//

import Foundation
import UIKit

class testViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var icon: UIImageView!
    
    @IBOutlet weak var navBar: NavBarWithBackButton!
    
    var text: String = ""
    var iconView: UIImageView?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = text
        icon.image = iconView?.image
        navBar.leftButton.addTarget(self, action: #selector(popOutViewController(_:)), for: .touchUpInside)
    }
    
    @objc func popOutViewController(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
}
