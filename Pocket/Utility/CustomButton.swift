//
//  CustomButton.swift
//  Pocket
//
//  Created by BS00484 on 18/8/24.
//

import Foundation
import UIKit

public class DefaultYellowButtonWithRoundCornerRadius: UIButton {
    let fontSize: CGFloat = AppFontSize.defaultButtonFontSize.rawValue

    public override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = bounds
    }

    private lazy var gradientLayer: CAGradientLayer = {
        let l = CAGradientLayer()
        l.frame = self.bounds
        l.colors = [Helper().gradientDarkGolden.cgColor, Helper().gradientLightGolden.cgColor]
        l.startPoint = CGPoint(x: 0, y: 1)
        l.endPoint = CGPoint(x: 0, y: 0.1)
        l.cornerRadius = bounds.width / 5
        layer.insertSublayer(l, at: 0)
        return l
    }()

    public override func awakeFromNib() {
        self.heightAnchor.constraint(equalToConstant: getButtonHeightWithRespectToDevice(buttonHeight: 50)).isActive = true
        self.clipsToBounds = true
        self.setTitleColor(Helper().buttonTextColor, for: .normal)
    }
}

public class DefaultGoldenButtonWithGradientAndRoundCornerRadius: UIButton {
    let fontSize: CGFloat = AppFontSize.defaultButtonFontSize.rawValue
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = bounds
    }
    
    private lazy var gradientLayer: CAGradientLayer = {
        let l = CAGradientLayer()
        l.frame = self.bounds
        l.colors = [Helper().gradientLightGolden.cgColor , Helper().gradientMidGolden.cgColor, Helper().gradientDarkGolden.cgColor ]
        l.startPoint = CGPoint(x: 0.0, y: 0.0)
        l.endPoint = CGPoint(x: 0.0, y: 1.0)
        l.cornerRadius = 13
        layer.insertSublayer(l, at: 0)
        return l
    }()
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
    }
}
