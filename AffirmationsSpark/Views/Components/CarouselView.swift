//
//  CarouselView.swift
//  AffirmationsSpark
//
//  Created by Савелий Коцур on 01.08.2024.
//

import SwiftUI

struct CarouselView: View {
    let phrases: [String]
    
    var body: some View {
        VStack {
            TabView {
                ForEach(phrases, id: \.self) { phrase in
                    Text(phrase)
                        .font(.system(size: 30, design: .serif))
                        .padding(.horizontal, 20)
                        .rotationEffect(.degrees(-90))
                        .multilineTextAlignment(.center)
                        .frame(maxWidth: UIScreen.main.bounds.width, maxHeight: UIScreen.main.bounds.height)
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            .frame(minWidth: UIScreen.main.bounds.height, minHeight: UIScreen.main.bounds.width)
            .rotationEffect(.degrees(90))
        }
    }
}
