//
//  DashboardVM.swift
//  Pocket
//
//  Created by BS00484 on 11/8/24.
//

import Foundation
import UIKit

public class DashboardVM {
    var servicesNotOnShortcut: [Service] = []
    var selectedShortcutIndex: IndexPath?
    
    init(servicesNotOnShortcut: [Service] = [], selectedShortcutIndex: IndexPath? = nil) {
        self.servicesNotOnShortcut = servicesNotOnShortcut
        self.selectedShortcutIndex = selectedShortcutIndex
    }
    
    func updateServicesNotOnShortcut() {
        
        servicesNotOnShortcut = listOfServices.filter { service in
            !servicesOnShortcut.contains { $0.title == service.title }
        }
    }
}
