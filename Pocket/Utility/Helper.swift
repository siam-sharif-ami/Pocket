//
//  Helper.swift
//  Pocket
//
//  Created by BS00484 on 18/8/24.
//

import Foundation
import UIKit

public class Helper: NSObject {
    public lazy var gradientLightGolden: UIColor = hexStringToUIColor(hex: "#F5F1AF")
    public lazy var gradientMidGolden: UIColor = hexStringToUIColor(hex: "#DCC685")
    public lazy var gradientDarkGolden: UIColor = hexStringToUIColor(hex: "#C49F5E")
    public lazy var buttonTextColor:UIColor = hexStringToUIColor(hex: "#000000").withAlphaComponent(0.7)
    
    public func hexStringToUIColor (hex: String) -> UIColor {
        var cString: String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

        if cString.hasPrefix("#") {
            cString.remove(at: cString.startIndex)
        }

        if (cString.count) != 6 {
            return UIColor.gray
        }

        var rgbValue: UInt32 = 0
        Scanner(string: cString).scanHexInt32(&rgbValue)

        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
}
