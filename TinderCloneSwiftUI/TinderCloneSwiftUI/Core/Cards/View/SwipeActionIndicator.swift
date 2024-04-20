//
//  SwipeActionIndicator.swift
//  TinderCloneSwiftUI
//
//  Created by Oleksandr Isaiev on 20.04.2024.
//

import SwiftUI

struct SwipeActionIndicator: View {
    var body: some View {
        HStack {
            Text("LIKE")
                .font(.title)
                .fontWeight(.heavy)
                .foregroundStyle(.green)
                .overlay {
                    RoundedRectangle(cornerRadius: 4)
                        .stroke(.green, lineWidth: 2)
                        .frame(width: 100, height: 48)
                }
                .rotationEffect(.degrees(-45))

            Spacer()

            Text("NOPE")
                .font(.title)
                .fontWeight(.heavy)
                .foregroundStyle(.red)
                .overlay {
                    RoundedRectangle(cornerRadius: 4)
                        .stroke(.red, lineWidth: 2)
                        .frame(width: 100, height: 48)
                }
                .rotationEffect(.degrees(45))
        }
        .padding(40)
    }
}

#Preview {
    SwipeActionIndicator()
}
