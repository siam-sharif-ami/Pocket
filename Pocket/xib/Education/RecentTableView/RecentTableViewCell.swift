//
//  RecentTableViewCell.swift
//  Pocket
//
//  Created by BS00484 on 15/8/24.
//

import UIKit

class RecentTableViewCell: UITableViewCell {

    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var iconBorderView: UIView!
    @IBOutlet weak var iconView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        iconBorderView.layer.borderWidth = 0.7
        iconBorderView.layer.borderColor = UIColor.lightGray.cgColor
        // Configure the view for the selected state
    }
    
    func updateCell(institutionName: String, imageString: String){
        self.name.text = institutionName
        self.iconView.image = UIImage(named: imageString)
    }
    
}
