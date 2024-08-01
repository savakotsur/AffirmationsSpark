//
//  StringsExtension.swift
//  AffirmationsSpark
//
//  Created by Савелий Коцур on 01.08.2024.
//

import Foundation
import SwiftUI

extension String {
    var localized: String {
        NSLocalizedString(self, comment: "\(self) could not localized")
    }
}

extension Color {
    func asGradient() -> LinearGradient {
        let gradientColors = [self.opacity(0.1), self.opacity(0.5), self.opacity(0.9)]
        return LinearGradient(gradient: Gradient(colors: gradientColors), startPoint: .top, endPoint: .bottom)
    }
    
    func asRadialGradient() -> RadialGradient {
        let gradientColors = [self.opacity(0.1), self.opacity(0.5), self.opacity(0.9)]
        return RadialGradient(gradient: Gradient(colors: gradientColors), center: .center, startRadius: 5, endRadius: 200)
    }
}
