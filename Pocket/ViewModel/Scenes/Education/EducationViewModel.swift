//
//  EducationViewModel.swift
//  Pocket
//
//  Created by BS00484 on 15/8/24.
//

import Foundation

class EducationViewModel {
    
    var matchedCategories: [Category]
    var matchedInstitutions: [Institutions]
    var selectedIndexOnCategoryCollectionView: IndexPath?
    
    init(matchedCategories: [Category] = categories, matchedInstitutions: [Institutions] = categories.flatMap{ $0.institutions }) {
        self.matchedCategories = matchedCategories
        self.matchedInstitutions = matchedInstitutions
    }
    
    func search(_ query: String) {
        let queryLowercased = query.lowercased()
        self.matchedCategories = categories.compactMap { category in
            let matchingInstitutions = category.institutions.filter { institution in
                institution.name.lowercased().contains(queryLowercased)
            }
            return matchingInstitutions.isEmpty ? nil : Category(name: category.name, logo: category.logo, institutions: matchingInstitutions)
        }
    }

    func matchingInstitutions(matchingCategories: [Category]) {
        self.matchedInstitutions = self.matchedCategories.flatMap { $0.institutions }
    }
}
