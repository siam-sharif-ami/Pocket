//
//  Services.swift
//  Pocket
//
//  Created by BS00484 on 29/7/24.
//

import Foundation
import UIKit

struct Service {
    var id: Int
    var title: String
    var icon: String
    var removeIcon: Bool = false
    var isOn: Bool = false 
}

var servicesOnShortcut: [Service] = [
    Service(id: 0, title: "Shortcut", icon: "plus"),
    Service(id: 0, title: "Shortcut", icon: "plus"),
    Service(id: 0, title: "Shortcut", icon: "plus"),
    Service(id: 0, title: "Shortcut", icon: "plus")
]

var listOfServices = [
    Service(id: 0, title:"Recharge", icon:"Type=Mobile Recharge" ),
    Service(id: 1, title:"Payment", icon:"Type=Bill Payment" ),
    Service(id: 2, title:"Add Money", icon:"Type=Add Money" ),
    Service(id: 3 , title:"Send Money", icon: "Type=Send Money"),
    Service(id: 4 , title:"Education", icon: "Type=Education Fee"),
    Service(id: 5 ,title: "Remittance", icon: "Type=Remittance"),
    Service(id: 6, title:"Request", icon:"Type=Request Money"),
    Service(id: 7,title:"Transfer", icon: "Type=Transfer"),
    Service(id: 8,title: "Cards", icon:"Type=Visa"),
    Service(id: 9,title: "Internet", icon: "Type=Internet"),
    Service(id: 10, title: "WASA", icon: "Type=Electricity"),
    Service(id: 11, title: "Electricity", icon: "Type=Electricity"),
    Service(id: 12, title:"Cable Tv", icon: "Type=Cable TV"),
    Service(id: 13, title:"Gas", icon: "Type=Gas"),
    Service(id: 14, title: "News", icon: "Type=News"),
    Service(id: 15, title: "EWPD", icon: "Type=EWPD"),
    Service(id: 16,title: "Govt. Pay", icon: "Type=Gov")
]
