//
//  SideMenuSections.swift
//  Pocket
//
//  Created by BS00484 on 7/8/24.
//

import Foundation
import UIKit

struct SideMenuSection{
    var icon: String
    var Title: String
}

var sideMenuSections = [
    ["": [SideMenuSection(icon: "Profile Icon", Title: "Siam Sharif Ami")]],
    ["Settings" : [SideMenuSection(icon: "Type=My QR", Title: "My QR"),
               SideMenuSection(icon: "Change Language", Title: "Change Language"),
               SideMenuSection(icon: "Appearance", Title: "Appearance"),
               SideMenuSection(icon: "Biometric Unlock", Title: "Biometric Unlock"),
               SideMenuSection(icon: "Floating Shortcut", Title: "Floating Shortcut"),
              ]],
    ["Account Service" : [SideMenuSection(icon: "Bank Accounts", Title: "Bank Accounts"),
                         SideMenuSection(icon: "Account Settings", Title: "Account Settings")]],
    ["Support" : [SideMenuSection(icon: "Feedback", Title: "Feedback"),
                 SideMenuSection(icon: "24x7 Support", Title: "24x7 Support"),
                 SideMenuSection(icon: "Refer", Title: "Refer"),
                 SideMenuSection(icon: "Limits & Usage", Title: "Limits & Usage"),
                ]]
]
