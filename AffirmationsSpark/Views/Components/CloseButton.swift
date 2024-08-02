//
//  CloseButton.swift
//  AffirmationsSpark
//
//  Created by Савелий Коцур on 02.08.2024.
//

import SwiftUI

struct CloseButton: View {
    @Environment(\.dismiss) var dismiss

    var body: some View {
        Button(action: {
            dismiss()
        }, label: {
            Image(systemName: "xmark")
        })
        .padding(.horizontal, 5)
    }
}
