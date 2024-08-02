//
//  OnboardingColorView.swift
//  AffirmationsSpark
//
//  Created by Савелий Коцур on 01.08.2024.
//

import SwiftUI

struct OnboardingColorView: View {
    @Binding var selectedBackgroundColor: BackgroundColor
    
    var body: some View {
        VStack {
            Text("choose_color".localized)
                .font(.title)
                .fontDesign(.serif)
                .padding()
            
            Picker("color".localized, selection: $selectedBackgroundColor) {
                ForEach(BackgroundColor.allCases) { color in
                    Text(color.displayName.localized).tag(color)
                        .fontDesign(.serif)
                }
            }
            .pickerStyle(InlinePickerStyle())
            .padding()
        }
    }
}
