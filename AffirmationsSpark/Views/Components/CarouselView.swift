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
                        .padding()
                        .rotationEffect(.degrees(-90))
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            .frame(minWidth: UIScreen.main.bounds.height - 200, minHeight: UIScreen.main.bounds.width)
            .rotationEffect(.degrees(90))
        }
    }
}
