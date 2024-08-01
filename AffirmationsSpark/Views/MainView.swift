//
//  ContentView.swift
//  AffirmationsSpark
//
//  Created by Савелий Коцур on 31.07.2024.
//

import SwiftUI

struct MainView: View {
    @AppStorage("hasSeenOnboarding") private var hasSeenOnboarding: Bool = false
    @AppStorage("affirmationsColor") private var backgroundColor: BackgroundColor = .blue
    let phrases = ["lsldflsa", "sadkosdoa", "sldalsd,ao", "samdosmdaosmd", "sadsmdoasodma"]
    
    var body: some View {
        if hasSeenOnboarding {
            VStack {
                HStack {
                    Spacer()
                    Button(action: {
                        print("1")
                    }, label: {
                        Image(systemName: "slider.horizontal.3")
                            .foregroundColor(.black)
                            .frame(maxWidth: 30, maxHeight: 30)
                            .background(backgroundColor.color.asGradient())
                            .cornerRadius(5)
                    })
                }
                .frame(maxWidth: UIScreen.main.bounds.width)
                .padding(.trailing)
                CarouselView(phrases: phrases)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(backgroundColor.color.asGradient())
        } else {
            OnboardingViewsContainer()
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
