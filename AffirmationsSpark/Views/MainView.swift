//
//  ContentView.swift
//  AffirmationsSpark
//
//  Created by Савелий Коцур on 31.07.2024.
//

import SwiftUI

struct MainView: View {
    @State private var path = NavigationPath()
    @StateObject private var mainVM = MainViewModel()
    @AppStorage("affirmationsColor") private var backgroundColor: BackgroundColor = .blue
    @State private var isSettingsOpened = false
    
    var body: some View {
        NavigationStack(path: $path) {
            ZStack {
                CarouselView(phrases: mainVM.affirmations)
                    .padding(.leading)
                VStack {
                    HStack (alignment: .top) {
                        Spacer()
                        Button(action: {
                            path.append("SettingsView")
                        }, label: {
                            Image(systemName: "slider.horizontal.3")
                                .foregroundColor(.black)
                                .imageScale(.large)
                                .frame(maxWidth: 35, maxHeight: 35)
                                .background(.white.asGradient())
                                .cornerRadius(8)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 8)
                                        .stroke(backgroundColor.color.asGradient())
                                )
                        })
                        .navigationDestination(for: String.self, destination: {_ in 
                        SettingsView(mainVM: mainVM)
                    })
                    .padding()
                    }
                    .frame(maxWidth: UIScreen.main.bounds.width)
                    .padding(.trailing)
                    Spacer()
                }
                VStack (alignment: .center) {
                    Spacer()
                    Image(systemName: "arrow.down")
                        .imageScale(.large)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(backgroundColor.color.asGradient())
            .fullScreenCover(isPresented: $isSettingsOpened) {
                SettingsView(mainVM: mainVM)
            }.presentationBackground(.black.opacity(0.5))
        }
    }
}
