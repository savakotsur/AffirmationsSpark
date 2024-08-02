//
//  ContentView.swift
//  AffirmationsSpark
//
//  Created by Савелий Коцур on 31.07.2024.
//

import SwiftUI

struct MainView: View {
    @StateObject private var mainVM = MainViewModel()
    @AppStorage("affirmationsColor") private var backgroundColor: BackgroundColor = .blue
    @State private var isSettingsOpened = false
    
    var body: some View {
            ZStack {
                CarouselView(phrases: mainVM.affirmations)
                    .padding(.leading)
                VStack {
                    HStack (alignment: .top) {
                        Spacer()
                        Button(action: {
                            isSettingsOpened.toggle()
                        }, label: {
                            Image(systemName: "slider.horizontal.3")
                                .foregroundColor(.black)
                                .imageScale(.large)
                                .frame(maxWidth: 35, maxHeight: 35)
                                .background(backgroundColor.color.asGradient())
                                .cornerRadius(5)
                        })
                        .padding()
                    }
                    .frame(maxWidth: UIScreen.main.bounds.width)
                    .padding(.trailing)
                    Spacer()
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(backgroundColor.color.asGradient())
            .fullScreenCover(isPresented: $isSettingsOpened) {
                SettingsView(mainVM: mainVM)
            }.presentationBackground(.black.opacity(0.5))
    }
}
