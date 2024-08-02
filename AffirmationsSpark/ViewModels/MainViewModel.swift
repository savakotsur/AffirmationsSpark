//
//  MainViewModel.swift
//  AffirmationsSpark
//
//  Created by Савелий Коцур on 02.08.2024.
//

import SwiftUI
import RealmSwift

class MainViewModel: ObservableObject {
    private var realm: Realm
    @Published var affirmations: [String] = []
    @AppStorage("affirmationsCategory") var selectedCategory: Category = .love
    @Published var selectedLanguage: String
    
    init() {
        realm = try! Realm()
        self.selectedLanguage = Locale.current.language.languageCode?.identifier ?? "en"
        fetchAffirmations()
    }
    
    func fetchAffirmations() {
        let results = realm.objects(Affirmation.self).filter("category == %@", selectedCategory.rawValue)
        var loadedAffirmations: [String] = []
        
        for affirmation in results {
            if let translation = affirmation.translations.first(where: { $0.languageCode == selectedLanguage }) {
                loadedAffirmations.append(translation.text)
            } else if let defaultTranslation = affirmation.translations.first(where: { $0.languageCode == "en" }) {
                loadedAffirmations.append(defaultTranslation.text)
            }
        }
        
        DispatchQueue.main.async {
            self.affirmations = loadedAffirmations
        }
    }
}
