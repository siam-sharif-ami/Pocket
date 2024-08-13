//
//  CACornerMask.swift
//  Pocket
//
//  Created by BS00484 on 12/8/24.
//

import Foundation
import UIKit

extension CACornerMask {
    static var noCorners: CACornerMask { return [] }
    
    static var topLeftCorner: CACornerMask { return .layerMinXMinYCorner }
    static var topRightCorner: CACornerMask { return .layerMaxXMinYCorner }
    static var bottomLeftCorner: CACornerMask { return .layerMinXMaxYCorner }
    static var bottomRightCorner: CACornerMask { return .layerMaxXMaxYCorner }
    
    static var topCorners: CACornerMask { return [.topLeftCorner, .topRightCorner] }
    static var bottomCorners: CACornerMask { return [.bottomLeftCorner, .bottomRightCorner] }
    
    static var leftCorners: CACornerMask { return [.topLeftCorner, .bottomLeftCorner] }
    static var rightCorners: CACornerMask { return [.topRightCorner, .bottomRightCorner] }
}

extension UIView {
    func set(corners: CACornerMask, radius cornderRadius: CGFloat){
        layer.cornerRadius = cornderRadius
        layer.maskedCorners = corners
    }
}
