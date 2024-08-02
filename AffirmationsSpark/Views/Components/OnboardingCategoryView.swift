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
                .font(.title)
                .fontDesign(.serif)
                .padding()
            
            Picker("category".localized, selection: $selectedCategory) {
                ForEach(Category.allCases) { category in
                    Text(category.displayName.localized).tag(category)
                        .fontDesign(.serif)
                }
            }
            .pickerStyle(InlinePickerStyle())
            .padding()
        }
    }
}
