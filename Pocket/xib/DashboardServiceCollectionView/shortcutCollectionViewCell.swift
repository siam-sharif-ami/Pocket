//
//  shortcutCollectionViewCell.swift
//  Pocket
//
//  Created by BS00484 on 31/7/24.
//

import UIKit

class shortcutCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var shortcutBgView: UIView!
    
    @IBOutlet weak var shortcutImageView: UIImageView!
    
    @IBOutlet weak var removeButtonWidth: NSLayoutConstraint!
    @IBOutlet weak var removeButtonHeight: NSLayoutConstraint!
    @IBOutlet weak var removeButton: UIButton!
    
    @IBOutlet weak var shortcutLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
