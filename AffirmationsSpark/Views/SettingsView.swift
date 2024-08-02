//
//  SettingsView.swift
//  AffirmationsSpark
//
//  Created by Савелий Коцур on 01.08.2024.
//

import SwiftUI

struct SettingsView: View {
    @ObservedObject var mainVM: MainViewModel
    @AppStorage("affirmationsCategory") private var selectedCategory: Category = .love
    @AppStorage("affirmationsColor") private var selectedBackgroundColor: BackgroundColor = .blue
    @AppStorage("affirmationsGender") private var selectedGender: Gender = .male
    @Environment(\.openURL) var openURL
    
    var body: some View {
        VStack {
            Form {
                Section(header: Text("settings".localized)) {
                    Picker("category".localized, selection: $selectedCategory) {
                        ForEach(Category.allCases) { category in
                            Text(category.displayName.localized).tag(category)
                        }
                    }
                    
                    Picker("bgcolor".localized, selection: $selectedBackgroundColor) {
                        ForEach(BackgroundColor.allCases) { color in
                            Text(color.displayName.localized).tag(color)
                        }
                    }
                    
                    Picker("gender".localized, selection: $selectedGender) {
                        ForEach(Gender.allCases) { gender in
                            Text(gender.displayName.localized).tag(gender)
                        }
                    }
                }
                Section(header: Text("language".localized)) {
                    Text("language_text".localized)
                    Button("go_to_settings".localized) {
                        openURL(URL(string: UIApplication.openSettingsURLString)!)
                    }
                }
            }
        }
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                CloseButton()
            }
        }
    }
}
