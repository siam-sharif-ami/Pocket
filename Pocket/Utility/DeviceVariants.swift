//
//  DeviceVariants.swift
//  Pocket
//
//  Created by BS00484 on 18/8/24.
//

import Foundation
//
//  DeviceVariants.swift
//  Utility
//
//  Created by BS1009 on 21/12/22.
//

import UIKit

public enum AppFontSize: CGFloat {
    case defaultInputTextFontSize = 16.0
    case defaultButtonFontSize = 18.0
    case dashboardMenuFontSize = 11.0
    case offerButtonFontSize = 10.0
    case transactionHistoryListTimeLabelSize = 12.0
    case largeButtonFontSize = 22.0
    case keyValueFontSize = 14.0
    case transactionHistoryTitleSize = 13.5
    case mediumFontSize = 17.0
    case addMoneyButtonFontSize = 13.0
    case chatAmountTextFontSize = 24.0
}

public enum AppFont: CGFloat {
    case size12 = 12.0
    case size13 = 13.0
    case size14 = 14.0
    case size15 = 15.0
    case size16 = 16.0
    case size17 = 17.0
    case size18 = 18.0
    case size20 = 20.00
    case size22 = 22.0
    case size36 = 36.0
}

public func getImageHeightWithRespectToDevice(imageHeight: CGFloat) -> CGFloat {
    switch UIDevice().type {
    case .iPhone6, .iPhone6S, .iPhone7, .iPhone8, .iPhoneSE2, .iPhoneSE3:
        return (imageHeight - 8)
    case .iPhone6plus, .iPhone6Splus, .iPhone7plus, .iPhone8plus:
        return (imageHeight - 4)
    case .iPhoneSE, .iPhone5, .iPhone5S, .iPhone5C:
        return (imageHeight - 8)
    case .iPod1, .iPod2, .iPod3, .iPod4, .iPod5, .iPad2, .iPad3, .iPad4, .iPad5, .iPad6, .iPadAir, .iPadAir2, .iPadMini, .iPadMini2, .iPadMini3, .iPadMini4, .iPadPro9_7, .iPadPro10_5, .iPadPro12_9, .iPadPro2_12_9:
        return (imageHeight + 2)

        default:
            return imageHeight
    }
}


public func getContentHeightWithRespectToDevice(contentHeight: CGFloat) -> CGFloat {
    switch UIDevice().type {
    case .iPhone6, .iPhone6S, .iPhone7, .iPhone8, .iPhoneSE2, .iPhoneSE3:
        return (contentHeight * 0.75)
    case .iPhone6plus, .iPhone6Splus, .iPhone7plus, .iPhone8plus:
        return (contentHeight * 0.90)
    case .iPhoneSE, .iPhone5, .iPhone5S, .iPhone5C:
        return (contentHeight * 0.75)
    case .iPod1, .iPod2, .iPod3, .iPod4, .iPod5, .iPad2, .iPad3, .iPad4, .iPad5, .iPad6, .iPadAir, .iPadAir2, .iPadMini, .iPadMini2, .iPadMini3, .iPadMini4, .iPadPro9_7, .iPadPro10_5, .iPadPro12_9, .iPadPro2_12_9:
        return (contentHeight * 1.60)

    default:
        return contentHeight
    }
}

public func getButtonHeightWithRespectToDevice(buttonHeight: CGFloat) -> CGFloat {
    switch UIDevice().type {
    case .iPhone6, .iPhone6S, .iPhone7, .iPhone8, .iPhoneSE2, .iPhoneSE3:
        return (buttonHeight * 0.75)
    case .iPhone6plus, .iPhone6Splus, .iPhone7plus, .iPhone8plus:
        return (buttonHeight * 0.90)
    case .iPhoneSE, .iPhone5, .iPhone5S, .iPhone5C:
        return (buttonHeight * 0.75)
    case .iPod1, .iPod2, .iPod3, .iPod4, .iPod5, .iPad2, .iPad3, .iPad4, .iPad5, .iPad6, .iPadAir, .iPadAir2, .iPadMini, .iPadMini2, .iPadMini3, .iPadMini4, .iPadPro9_7, .iPadPro10_5, .iPadPro12_9, .iPadPro2_12_9:
        return (buttonHeight * 1.60)

        default:
            return buttonHeight
    }
}

public func getTextFieldHeightWithRespectToDevice(height: CGFloat) -> CGFloat {
    switch UIDevice().type {
    case .iPhone6, .iPhone6S, .iPhone7, .iPhone8, .iPhoneSE2, .iPhoneSE3:
        return (height * 0.75)
    case .iPhone6plus, .iPhone6Splus, .iPhone7plus, .iPhone8plus:
        return (height * 0.90)
    case .iPhoneSE, .iPhone5, .iPhone5S, .iPhone5C:
        return (height * 0.75)
    case .iPod1, .iPod2, .iPod3, .iPod4, .iPod5, .iPad2, .iPad3, .iPad4, .iPad5, .iPad6, .iPadAir, .iPadAir2, .iPadMini, .iPadMini2, .iPadMini3, .iPadMini4, .iPadPro9_7, .iPadPro10_5, .iPadPro12_9, .iPadPro2_12_9:
        return (height * 1.60)

        default:
            return height
    }
}

public func getFontSizeWithRespectToDevice(minimumFontSize: CGFloat) -> CGFloat {
    switch UIDevice().type {
    case .iPhone6, .iPhone6S, .iPhone7, .iPhone8, .iPhoneSE2, .iPhoneSE3:
        return (minimumFontSize - 1)
    case .iPhone6plus, .iPhone6Splus, .iPhone7plus, .iPhone8plus:
        return (minimumFontSize - 0.75)
    case .iPhoneSE, .iPhone5, .iPhone5S, .iPhone5C:
        return (minimumFontSize - 1)
    case .iPod1, .iPod2, .iPod3, .iPod4, .iPod5, .iPad2, .iPad3, .iPad4, .iPad5, .iPad6, .iPadAir, .iPadAir2, .iPadMini, .iPadMini2, .iPadMini3, .iPadMini4, .iPadPro9_7, .iPadPro10_5, .iPadPro12_9, .iPadPro2_12_9:
        return (minimumFontSize + 1)

        default:
            return minimumFontSize
    }
}

public func getFontSizeWithRespectToDeviceForDashboard(minimumFontSize: CGFloat) -> CGFloat {
    switch UIDevice().type {
        case .iPhone6, .iPhone6S, .iPhone7, .iPhone8, .iPhoneSE2, .iPhoneSE3:
            return (minimumFontSize - 3)
        case .iPhone6plus, .iPhone6Splus, .iPhone7plus, .iPhone8plus:
            return (minimumFontSize - 1.5)
        case .iPhoneSE, .iPhone5, .iPhone5S, .iPhone5C:
            return (minimumFontSize - 4)
        case .iPod1, .iPod2, .iPod3, .iPod4, .iPod5, .iPad2, .iPad3, .iPad4, .iPad5, .iPad6, .iPadAir, .iPadAir2, .iPadMini, .iPadMini2, .iPadMini3, .iPadMini4, .iPadPro9_7, .iPadPro10_5, .iPadPro12_9, .iPadPro2_12_9:
            return (minimumFontSize + 1)

        default:
            return minimumFontSize
    }
}

public func getCellSizeForDashboardTransactionHistory() -> CGFloat {
    switch UIDevice().type {
        case .iPhone6, .iPhone6S, .iPhone7, .iPhone8, .iPhoneSE2, .iPhoneSE3:
            return 2.0
        case .iPhone6plus, .iPhone6Splus, .iPhone7plus, .iPhone8plus:
            return 3.0
        case .iPhoneSE, .iPhone5, .iPhone5S, .iPhone5C:
            return 2.0
        case .iPod1, .iPod2, .iPod3, .iPod4, .iPod5, .iPad2, .iPad3, .iPad4, .iPad5, .iPad6, .iPadAir, .iPadAir2, .iPadMini, .iPadMini2, .iPadMini3, .iPadMini4, .iPadPro9_7, .iPadPro10_5, .iPadPro12_9, .iPadPro2_12_9:
            return 3.0

        default:
            return 3.0
    }
}

public func getTopPaddingRespectToDevice() -> CGFloat {
    switch UIDevice().type {
    case .iPhone6, .iPhone6S, .iPhone7, .iPhone8, .iPhoneSE2, .iPhoneSE3:
        return 0
    case .iPhone6plus, .iPhone6Splus, .iPhone7plus, .iPhone8plus:
        return 0
    case .iPhoneSE, .iPhone5, .iPhone5S, .iPhone5C:
        return 0
    case .iPod1, .iPod2, .iPod3, .iPod4, .iPod5, .iPad2, .iPad3, .iPad4, .iPad5, .iPad6, .iPadAir, .iPadAir2, .iPadMini, .iPadMini2, .iPadMini3, .iPadMini4, .iPadPro9_7, .iPadPro10_5, .iPadPro12_9, .iPadPro2_12_9:
        return 40.scale

    default:
        return 35.scale
    }
}

public enum EnumModel: String {
    case simulator     = "simulator/sandbox",
         // iPod
         iPod1              = "iPod 1",
         iPod2              = "iPod 2",
         iPod3              = "iPod 3",
         iPod4              = "iPod 4",
         iPod5              = "iPod 5",
         // iPad
         iPad2              = "iPad 2",
         iPad3              = "iPad 3",
         iPad4              = "iPad 4",
         iPadAir            = "iPad Air ",
         iPadAir2           = "iPad Air 2",
         iPad5              = "iPad 5", // aka iPad 2017
         iPad6              = "iPad 6", // aka iPad 2018
         // iPad mini
         iPadMini           = "iPad Mini",
         iPadMini2          = "iPad Mini 2",
         iPadMini3          = "iPad Mini 3",
         iPadMini4          = "iPad Mini 4",
         // iPad pro
         iPadPro9_7         = "iPad Pro 9.7\"",
         iPadPro10_5        = "iPad Pro 10.5\"",
         iPadPro12_9        = "iPad Pro 12.9\"",
         iPadPro2_12_9      = "iPad Pro 2 12.9\"",
         // iPhone
         iPhone4            = "iPhone 4",
         iPhone4S           = "iPhone 4S",
         iPhone5            = "iPhone 5",
         iPhone5S           = "iPhone 5S",
         iPhone5C           = "iPhone 5C",
         iPhone6            = "iPhone 6",
         iPhone6plus        = "iPhone 6 Plus",
         iPhone6S           = "iPhone 6S",
         iPhone6Splus       = "iPhone 6S Plus",
         iPhoneSE           = "iPhone SE",
         iPhoneSE2          = "iPhone SE 2nd gen",
         iPhone7            = "iPhone 7",
         iPhone7plus        = "iPhone 7 Plus",
         iPhone8            = "iPhone 8",
         iPhone8plus        = "iPhone 8 Plus",
         iPhoneX            = "iPhone X",
         iPhoneXS           = "iPhone XS",
         iPhoneXSMax        = "iPhone XS Max",
         iPhoneXR           = "iPhone XR",
         iPhone11           = "iPhone 11",
         iPhone11Pro        = "iPhone 11 Pro",
         iPhone11ProMax     = "iPhone 11 Pro Max",
         iPhone12Mini       = "iPhone 12 Mini",
         iPhone12           = "iPhone 12",
         iPhone12Pro        = "iPhone 12 Pro",
         iPhone12ProMax     = "iPhone 12 Pro Max",
         iPhone13Mini       = "iPhone 13 Mini",
         iPhone13           = "iPhone 13",
         iPhone13Pro        = "iPhone 13 Pro",
         iPhone13ProMax     = "iPhone 13 Pro Max",
         iPhoneSE3          = "iPhone SE 3nd gen",
         iPhone14           = "iPhone 14",
         iPhone14Plus       = "iPhone 14 Plus",
         iPhone14Pro        = "iPhone 14 Pro",
         iPhone14ProMax     = "iPhone 14 Pro Max",
         iPhone15           = "iPhone 15",
         iPhone15Plus       = "iPhone 15 Plus",
         iPhone15Pro        = "iPhone 15 Pro",
         iPhone15ProMax     = "iPhone 15 Pro Max",
         // Apple TV
         AppleTV            = "Apple TV",
         AppleTV_4K         = "Apple TV 4K",
         unrecognized       = "?unrecognized?"
}

public extension UIDevice {
    var type: EnumModel {
        var systemInfo = utsname()
        uname(&systemInfo)
        let modelCode = withUnsafePointer(to: &systemInfo.machine) {
            $0.withMemoryRebound(to: CChar.self, capacity: 1) {
                ptr in String.init(validatingUTF8: ptr)

            }
        }
        let modelMap: [ String: EnumModel ] = [
            "i386": .simulator,
            "x86_64": .simulator,
            "arm64": .simulator,
            // iPod
            "iPod1,1": .iPod1,
            "iPod2,1": .iPod2,
            "iPod3,1": .iPod3,
            "iPod4,1": .iPod4,
            "iPod5,1": .iPod5,
            // iPad
            "iPad2,1": .iPad2,
            "iPad2,2": .iPad2,
            "iPad2,3": .iPad2,
            "iPad2,4": .iPad2,
            "iPad3,1": .iPad3,
            "iPad3,2": .iPad3,
            "iPad3,3": .iPad3,
            "iPad3,4": .iPad4,
            "iPad3,5": .iPad4,
            "iPad3,6": .iPad4,
            "iPad4,1": .iPadAir,
            "iPad4,2": .iPadAir,
            "iPad4,3": .iPadAir,
            "iPad5,3": .iPadAir2,
            "iPad5,4": .iPadAir2,
            "iPad6,11": .iPad5, // aka iPad 2017
            "iPad6,12": .iPad5,
            "iPad7,5": .iPad6, // aka iPad 2018
            "iPad7,6": .iPad6,
            // iPad mini
            "iPad2,5": .iPadMini,
            "iPad2,6": .iPadMini,
            "iPad2,7": .iPadMini,
            "iPad4,4": .iPadMini2,
            "iPad4,5": .iPadMini2,
            "iPad4,6": .iPadMini2,
            "iPad4,7": .iPadMini3,
            "iPad4,8": .iPadMini3,
            "iPad4,9": .iPadMini3,
            "iPad5,1": .iPadMini4,
            "iPad5,2": .iPadMini4,
            // iPad pro
            "iPad6,3": .iPadPro9_7,
            "iPad6,4": .iPadPro9_7,
            "iPad7,3": .iPadPro10_5,
            "iPad7,4": .iPadPro10_5,
            "iPad6,7": .iPadPro12_9,
            "iPad6,8": .iPadPro12_9,
            "iPad7,1": .iPadPro2_12_9,
            "iPad7,2": .iPadPro2_12_9,
            // iPhone
            "iPhone3,1": .iPhone4,
            "iPhone3,2": .iPhone4,
            "iPhone3,3": .iPhone4,
            "iPhone4,1": .iPhone4S,
            "iPhone5,1": .iPhone5,
            "iPhone5,2": .iPhone5,
            "iPhone5,3": .iPhone5C,
            "iPhone5,4": .iPhone5C,
            "iPhone6,1": .iPhone5S,
            "iPhone6,2": .iPhone5S,
            "iPhone7,1": .iPhone6plus,
            "iPhone7,2": .iPhone6,
            "iPhone8,1": .iPhone6S,
            "iPhone8,2": .iPhone6Splus,
            "iPhone8,4": .iPhoneSE,
            "iPhone9,1": .iPhone7,
            "iPhone9,3": .iPhone7,
            "iPhone9,2": .iPhone7plus,
            "iPhone9,4": .iPhone7plus,
            "iPhone10,1": .iPhone8,
            "iPhone10,4": .iPhone8,
            "iPhone10,2": .iPhone8plus,
            "iPhone10,5": .iPhone8plus,
            "iPhone10,3": .iPhoneX,
            "iPhone10,6": .iPhoneX,
            "iPhone11,2": .iPhoneXS,
            "iPhone11,4": .iPhoneXSMax,
            "iPhone11,6": .iPhoneXSMax,
            "iPhone11,8": .iPhoneXR,
            "iPhone12,1": .iPhone11,
            "iPhone12,3": .iPhone11Pro,
            "iPhone12,5": .iPhone11ProMax,
            "iPhone12,8": .iPhoneSE2,
            "iPhone13,1": .iPhone12Mini,
            "iPhone13,2": .iPhone12,
            "iPhone13,3": .iPhone12Pro,
            "iPhone13,4": .iPhone12ProMax,
            "iPhone14,4": .iPhone13Mini,
            "iPhone14,5": .iPhone13,
            "iPhone14,2": .iPhone13Pro,
            "iPhone14,3": .iPhone13ProMax,
            "iPhone14,6": .iPhoneSE3,
            "iPhone14,7": .iPhone14,
            "iPhone14,8": .iPhone14Plus,
            "iPhone15,2": .iPhone14Pro,
            "iPhone15,3": .iPhone14ProMax,
            "iPhone15,4": .iPhone15,
            "iPhone15,5": .iPhone15Plus,
            "iPhone16,1": .iPhone15Pro,
            "iPhone16,2": .iPhone15ProMax,
            // AppleTV
            "AppleTV5,3": .AppleTV,
            "AppleTV6,2": .AppleTV_4K
        ]

        guard let mcode = modelCode, let map = String(validatingUTF8: mcode), let model = modelMap[map] else { return EnumModel.unrecognized }
        if model == .simulator {
            if let simModelCode = ProcessInfo().environment["SIMULATOR_MODEL_IDENTIFIER"] {
                if let simMap = String(validatingUTF8: simModelCode), let simModel = modelMap[simMap] {
                    return simModel
                }
            }
        }

        return model
    }
}
