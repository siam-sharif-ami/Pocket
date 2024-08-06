//
//  transactionsTableViewCell.swift
//  Pocket
//
//  Created by BS00484 on 6/8/24.
//

import UIKit

class transactionsTableViewCell: UITableViewCell {

    @IBOutlet weak var icon: UIImageView!
    
    @IBOutlet weak var transactionTitle: UILabel!
    @IBOutlet weak var amount: UILabel!
    
    @IBOutlet weak var takaIcon: UIImageView!
    @IBOutlet weak var minusOrPlus: UILabel!
    @IBOutlet weak var date: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
