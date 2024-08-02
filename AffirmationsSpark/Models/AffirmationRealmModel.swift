//
//  AffirmationRealmModel.swift
//  AffirmationsSpark
//
//  Created by Савелий Коцур on 02.08.2024.
//

import RealmSwift

class LocalizedText: Object {
    @Persisted(primaryKey: true) var _id: ObjectId
    @Persisted var languageCode: String
    @Persisted var text: String
    
    convenience init(languageCode: String, text: String) {
        self.init()
        self.languageCode = languageCode
        self.text = text
    }
}

class Affirmation: Object {
    @Persisted(primaryKey: true) var _id: ObjectId
    @Persisted var category: String
    @Persisted var translations: List<LocalizedText>
    
    convenience init(category: String, translations: List<LocalizedText>) {
        self.init()
        self.category = category
        self.translations = translations
    }
}
