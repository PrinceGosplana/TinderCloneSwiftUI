//
//  UserInfo.swift
//  TinderCloneSwiftUI
//
//  Created by Oleksandr Isaiev on 20.04.2024.
//

import SwiftUI

struct UserInfo: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("Megan")
                    .font(.title)
                    .fontWeight(.heavy)

                Text("37")
                    .font(.title)
                    .fontWeight(.semibold)

                Spacer()

                Button {

                }label: {
                    Image(systemName: "arrow.up.circle")
                        .fontWeight(.bold)
                        .imageScale(.large)
                }
            }

            Text("Actress | Witch")
                .font(.subheadline)
                .lineLimit(2)
        }
        .foregroundStyle(.white)
        .padding()
        .background(
            LinearGradient(colors: [.clear, .black], startPoint: .top, endPoint: .bottom)
        )
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    UserInfo()
}
