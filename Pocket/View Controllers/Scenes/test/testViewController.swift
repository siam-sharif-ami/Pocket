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
    var text: String = ""
    var iconView: UIImageView?
    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = text
        icon.image = iconView?.image
    }
}
