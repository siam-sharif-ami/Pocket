//
//  CommonClass.swift
//  Pocket
//
//  Created by BS01550 on 25/8/24.
//

import Foundation
import UIKit

public class CustomGradientView : UIView {
    public override class var layerClass: AnyClass {
        return CAGradientLayer.self
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupGradient()
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setupGradient()
    }
    
    private func setupGradient(){
        guard let gradientLayer = layer as? CAGradientLayer else { return }
        let bottomViewColor = Helper().bottomViewColor
        let startColor = bottomViewColor.withAlphaComponent(0.0).cgColor
        let endColor = bottomViewColor.withAlphaComponent(0.9).cgColor
        gradientLayer.colors = [startColor,endColor]
    }
}
