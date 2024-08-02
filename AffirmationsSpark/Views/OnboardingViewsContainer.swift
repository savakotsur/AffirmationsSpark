//
//  OnboardingViewsContainer.swift
//  AffirmationsSpark
//
//  Created by Савелий Коцур on 01.08.2024.
//

import SwiftUI

struct OnboardingViewsContainer: View {
    @AppStorage("hasSeenOnboarding") private var hasSeenOnboarding: Bool = false
    @State private var currentStep: Int = 0
    @AppStorage("affirmationsCategory") private var selectedCategory: Category = .love
    @AppStorage("affirmationsColor") private var selectedBackgroundColor: BackgroundColor = .blue
    @AppStorage("affirmationsGender") private var selectedGender: Gender = .male
    
    var body: some View {
        VStack {
            switch currentStep {
            case 0:
                OnboardingCategoryView(selectedCategory: $selectedCategory)
                    .transition(.move(edge: .trailing))
            case 1:
                OnboardingColorView(selectedBackgroundColor: $selectedBackgroundColor)
                    .transition(.move(edge: .trailing))
            case 2:
                OnboardingGenderView(selectedGender: $selectedGender)
                    .transition(.move(edge: .trailing))
            default:
                EmptyView()
            }
            
            Spacer()
            
            Button(action: {
                withAnimation {
                    if currentStep < 2 {
                        currentStep += 1
                    } else {
                        hasSeenOnboarding = true
                    }
                }
                
            }) {
                Text(currentStep < 2 ? "next_button".localized : "start_button".localized)
                    .fontDesign(.serif)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(.pink)
                    .foregroundColor(.white)
                    .cornerRadius(100)
            }
            .padding()
        }
        .padding()
    }
}
