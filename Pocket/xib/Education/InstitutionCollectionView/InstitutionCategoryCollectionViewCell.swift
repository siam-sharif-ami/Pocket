//
//  InstitutionCategoryCollectionViewCell.swift
//  Pocket
//
//  Created by BS00484 on 15/8/24.
//

import UIKit

class InstitutionCategoryCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var bgView: UIView!
    
    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var categoryName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func updateCell(categoryLabel: String, imageString: String, selectedColor: UIColor){
        self.categoryName.text = categoryLabel
        self.icon.image = UIImage(named: imageString)
        self.bgView.backgroundColor = selectedColor
    }

}
