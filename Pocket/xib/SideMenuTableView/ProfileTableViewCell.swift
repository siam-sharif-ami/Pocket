//
//  ProfileTableViewCell.swift
//  Pocket
//
//  Created by BS00484 on 7/8/24.
//

import UIKit

class ProfileTableViewCell: UITableViewCell {

    @IBOutlet weak var profileName: UILabel!
    @IBOutlet weak var profileIcon: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
