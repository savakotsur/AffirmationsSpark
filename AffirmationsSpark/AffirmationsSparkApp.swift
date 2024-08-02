//
//  AffirmationsSparkApp.swift
//  AffirmationsSpark
//
//  Created by Савелий Коцур on 31.07.2024.
//

import SwiftUI

@main
struct AffirmationsSparkApp: App {
    @AppStorage("hasSeenOnboarding") private var hasSeenOnboarding: Bool = false
    
    init() {
        DispatchQueue.main.async {
            DataPreloader.preloadData()
        }
    }
    
    var body: some Scene {
        WindowGroup {
            if hasSeenOnboarding {
                MainView()
            } else {
                OnboardingViewsContainer()
            }
        }
    }
}
