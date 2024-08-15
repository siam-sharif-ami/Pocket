//
//  Category.swift
//  Pocket
//
//  Created by BS00484 on 15/8/24.
//

import Foundation

class Category {
    var name: String
    var logo: String
    var institutions: [Institutions]
    
    init(name: String, logo: String, institutions: [Institutions]) {
        self.name = name
        self.logo = logo
        self.institutions = institutions
    }
}

class Institutions {
    var name: String
    var logo: String
    
    init(name: String, logo: String) {
        self.name = name
        self.logo = logo
    }
}

var categories: [Category] = [
    Category(name: "School", logo: "School", institutions: [
        Institutions(name: "Ispahani Public School and College", logo: ""),
        Institutions(name: "Zilla School", logo: ""),
        Institutions(name: "Motijheel Ideal School", logo: "")
    ]),
    Category(name: "College", logo: "College", institutions: [
        Institutions(name: "Notre Dame College", logo: ""),
        Institutions(name: "Dhaka College", logo: ""),
        Institutions(name: "Victoria College", logo: "")
    ]),
    Category(name: "Madrasah", logo: "Madrasah", institutions: [
        Institutions(name: "Notre Dame College", logo: ""),
        Institutions(name: "Dhaka College", logo: ""),
        Institutions(name: "Victoria College", logo: "")
    ]),
    Category(name: "University", logo: "University", institutions: [
        Institutions(name: "Noakhali Science and Technology University - NSTU ", logo: ""),
        Institutions(name: "Chittagong University of Engineering and Technology - CUET", logo: ""),
        Institutions(name: "Bangladesh University of Engineering and Technology- BUET", logo: ""),
        Institutions(name: "Dhaka University - DU ", logo: ""),
        Institutions(name: "Chittagong University - CU ", logo: "")
    ]),
    Category(name: "Training", logo: "Training", institutions: [
        Institutions(name: "IT Training", logo: ""),
        Institutions(name: "Brain Station 23", logo: ""),
        Institutions(name: "WellDev", logo: ""),
        Institutions(name: "Kite Games Studio", logo: "")
    ])
]



