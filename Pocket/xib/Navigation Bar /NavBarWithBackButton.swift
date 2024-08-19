//
//  navBarWithBackButton.swift
//  Pocket
//
//  Created by BS00484 on 19/8/24.
//

import Foundation
import UIKit


class NavBarWithBackButton: UIView {

    private static let NIB_Name = "NavBarWithBackButton"
    
    
    
    @IBOutlet var view: UIView!
    @IBOutlet weak var leftButton: UIButton!
  
    @IBOutlet weak var titleLabel: UILabel!
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//    }
//    
//    required init?(coder: NSCoder) {
//        super.init(coder: coder)
//        self.
//    }
    
    
    var title: String = "" {
        didSet{
            titleLabel.text = title
        }
    }
    
    var isLeftButtonHidden: Bool {
        set {
            leftButton.isHidden = newValue
        }
        get {
            return leftButton.isHidden
        }
    }
    
    override func awakeFromNib() {
        initWithNib()
    }
    private func initWithNib() {
        Bundle.main.loadNibNamed(NavBarWithBackButton.NIB_Name, owner: self, options: nil)
        view?.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)
        setupLayout()
    }
    
    private func setupLayout(){
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: topAnchor),
            view.leadingAnchor.constraint(equalTo: leadingAnchor),
            view.bottomAnchor.constraint(equalTo: bottomAnchor),
            view.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
    }

}
