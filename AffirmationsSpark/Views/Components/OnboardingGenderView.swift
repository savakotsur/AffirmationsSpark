//
//  OnboardingGenderView.swift
//  AffirmationsSpark
//
//  Created by Савелий Коцур on 01.08.2024.
//

import SwiftUI

struct OnboardingGenderView: View {
    @Binding var selectedGender: Gender
    
    var body: some View {
        VStack {
            Text("choose_gender".localized)
                .font(.largeTitle)
                .padding()
            
            Picker("gender".localized, selection: $selectedGender) {
                ForEach(Gender.allCases) { gender in
                    Text(gender.displayName.localized).tag(gender)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()
        }
    }
}
