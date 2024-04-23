//
//  BackChevronButton.swift
//  TinderCloneSwiftUI
//
//  Created by Oleksandr Isaiev on 23.04.2024.
//

import SwiftUI

struct BackChevronButton: View {
    
    @Environment(\.dismiss) var dismiss

    var body: some View {
        Button {
            dismiss()
        } label: {
            Image(systemName: "chevron.left")
                .imageScale(.large)
                .fontWeight(.heavy)
                .foregroundStyle(Color(.primaryText))
        }
    }
}

#Preview {
    BackChevronButton()
}
