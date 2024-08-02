//
//  DataPreloader.swift
//  AffirmationsSpark
//
//  Created by Савелий Коцур on 02.08.2024.
//

import RealmSwift

class DataPreloader {
    static func preloadData() {
        let realm = try! Realm()
        
        if realm.objects(Affirmation.self).isEmpty {
            let loveAffirmations = [
                ((languageCode: "en", text: "I am worthy of love and deserve to receive love in abundance"),
                 (languageCode: "ru", text: "Я достоин любви и заслуживаю получать любовь в изобилии")),
                ((languageCode: "en", text: "My heart is open to giving and receiving love"),
                 (languageCode: "ru", text: "Мое сердце открыто дарить и получать любовь")),
                ((languageCode: "en", text: "I am surrounded by love every day and in every way"),
                 (languageCode: "ru", text: "Я окружен любовью каждый день и во всех смыслах")),
                ((languageCode: "en", text: "I attract love and loving relationships into my life"),
                 (languageCode: "ru", text: "Я привлекаю любовь и любовные отношения в свою жизнь")),
                ((languageCode: "en", text: "Love flows to me and through me effortlessly"),
                 (languageCode: "ru", text: "Любовь легко течет ко мне и через меня")),
                ((languageCode: "en", text: "I radiate love and others reflect love back to me"),
                 (languageCode: "ru", text: "Я излучаю любовь, и другие отражают ее мне в ответ")),
                ((languageCode: "en", text: "My relationships are filled with love, happiness, and respect"),
                 (languageCode: "ru", text: "Мои отношения наполнены любовью, счастьем и уважением")),
                ((languageCode: "en", text: "I am grateful for the love that surrounds me"),
                 (languageCode: "ru", text: "Я благодарен за любовь, которая меня окружает")),
                ((languageCode: "en", text: "Love comes to me easily and effortlessly"),
                 (languageCode: "ru", text: "Любовь приходит ко мне легко и непринужденно")),
                ((languageCode: "en", text: "I am a magnet for loving and fulfilling relationships"),
                 (languageCode: "ru", text: "Я магнит для любящих и полноценных отношений")),
                
                
            ]
            
            let friendshipAffirmations = [
                ((languageCode: "en", text: "I am surrounded by supportive and loving friends"),
                 (languageCode: "ru", text: "Меня окружают поддерживающие и любящие друзья")),
                ((languageCode: "en", text: "I attract positive and loyal friendships into my life"),
                 (languageCode: "ru", text: "Я привлекаю позитивных и верных друзей в свою жизнь")),
                ((languageCode: "en", text: "My friends and I share mutual respect and trust"),
                 (languageCode: "ru", text: "Мы с друзьями разделяем взаимное уважение и доверие")),
                ((languageCode: "en", text: "I am a kind and caring friend, and I receive the same in return"),
                 (languageCode: "ru", text: "Я добрый и заботливый друг, и получаю взамен то же самое")),
                ((languageCode: "en", text: "My friendships are filled with joy, laughter, and understanding"),
                 (languageCode: "ru", text: "Моя дружба наполнена радостью, смехом и пониманием")),
                ((languageCode: "en", text: "I am grateful for the amazing friends in my life"),
                 (languageCode: "ru", text: "Я благодарен за замечательных друзей в моей жизни")),
                ((languageCode: "en", text: "I nurture and cherish my friendships"),
                 (languageCode: "ru", text: "Я лелею и ценю свою дружбу")),
                ((languageCode: "en", text: "I attract friends who support and uplift me"),
                 (languageCode: "ru", text: "Я привлекаю друзей, которые поддерживают и поднимают мне настроение")),
                ((languageCode: "en", text: "My friends and I grow together in love and harmony"),
                 (languageCode: "ru", text: "Мы с друзьями вместе растем в любви и гармонии")),
                ((languageCode: "en", text: "I am a magnet for genuine and lasting friendships"),
                 (languageCode: "ru", text: "Я магнит для настоящей и прочной дружбы")),
            ]
            
            try! realm.write {
                for (enText, ruText) in loveAffirmations {
                    let affirmation = Affirmation()
                    affirmation.category = "love"
                    
                    let enTranslation = LocalizedText(languageCode: "en", text: enText.text)
                    let ruTranslation = LocalizedText(languageCode: "ru", text: ruText.text)
                    
                    affirmation.translations.append(objectsIn: [enTranslation, ruTranslation])
                    realm.add(affirmation)
                }
                
                for (enText, ruText) in friendshipAffirmations {
                    let affirmation = Affirmation()
                    affirmation.category = "friendship"
                    
                    let enTranslation = LocalizedText(languageCode: "en", text: enText.text)
                    let ruTranslation = LocalizedText(languageCode: "ru", text: ruText.text)
                    
                    affirmation.translations.append(objectsIn: [enTranslation, ruTranslation])
                    realm.add(affirmation)
                }
            }
        }
    }
}

