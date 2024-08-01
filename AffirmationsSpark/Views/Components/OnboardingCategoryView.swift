//
//  OnboardingCategoryView.swift
//  AffirmationsSpark
//
//  Created by Савелий Коцур on 01.08.2024.
//

import SwiftUI

struct OnboardingCategoryView: View {
    @Binding var selectedCategory: Category

    var body: some View {
        VStack {
            Text("choose_category".localized)
                .font(.largeTitle)
                .padding()
            
            Picker("category".localized, selection: $selectedCategory) {
                ForEach(Category.allCases) { category in
                    Text(category.displayName.localized).tag(category)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()
        }
    }
}
