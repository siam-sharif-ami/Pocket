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
    public lazy var bottomViewColor: UIColor = hexStringToUIColor(hex: "#F3F3F3")
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
    
    public func getAmountWithIcon(amount: String, isType: String) -> NSAttributedString {
            let completeText = NSMutableAttributedString()
            let imageAttachment = NSTextAttachment()
            let width = getContentHeightWithRespectToDevice(contentHeight: 9)
            let height = getContentHeightWithRespectToDevice(contentHeight: 13)
            imageAttachment.bounds = CGRect(x: 0, y: 0, width: width, height: height)
            
            if isType == "credit" {
                completeText.append(NSAttributedString(string: "+"))
                imageAttachment.image = UIImage(named: "green_taka_icon")
            } else {
                completeText.append(NSAttributedString(string: "-"))
                imageAttachment.image = UIImage(named: "red_taka_icon")
            }
            
            let attachmentString = NSAttributedString(attachment: imageAttachment)
            completeText.append(attachmentString)
        let textAfterIcon = NSAttributedString(string: " " + amount.withComma())
                completeText.append(textAfterIcon)
            
               return completeText
           }
    
}

public extension String {
    func withComma() -> String {
        var val = ""
        for item in self {
            if item != ","{
                val.append(item)
            }
        }
        let numberFormatter = NumberFormatter()
        numberFormatter.usesGroupingSeparator = true
        numberFormatter.groupingSize = 3
        numberFormatter.numberStyle = .decimal
        numberFormatter.locale = Locale(identifier: "en_US")
        numberFormatter.maximumFractionDigits = 2
        numberFormatter.minimumFractionDigits = 2
        return numberFormatter.string(from: NSNumber(value: Double(val) ?? 0.00))!
    }
}
