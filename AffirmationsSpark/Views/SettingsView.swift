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
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Button(action: {
                    mainVM.fetchAffirmations()
                    dismiss()
                }, label: {
                    Image(systemName: "xmark")
                        .foregroundColor(.black)
                        .imageScale(.large)
                        .frame(maxWidth: 35, maxHeight: 35)
                        .background(.gray)
                        .cornerRadius(100)
                })
                .padding()
            }
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
                    Text("language_text".localized)
                    Link("go_to_settings".localized, destination: URL(string: UIApplication.openSettingsURLString)!)
                        .padding()
                        .font(.subheadline)
                }
            }
        }
    }
}
