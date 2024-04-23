//
//  NextButton.swift
//  TinderCloneSwiftUI
//
//  Created by Oleksandr Isaiev on 23.04.2024.
//

import SwiftUI

struct NextButton: View {

    @EnvironmentObject var manager: OnboardingManager

    var body: some View {
        Button {
            manager.navigate()
        } label: {
            Text("Next")
                .font(.subheadline)
                .fontWeight(.semibold)
                .foregroundStyle(.white)
                .frame(width: 350, height: 44)
                .background(.primaryPink)
                .clipShape(Capsule())

        }
    }
}

#Preview {
    NextButton()
}
