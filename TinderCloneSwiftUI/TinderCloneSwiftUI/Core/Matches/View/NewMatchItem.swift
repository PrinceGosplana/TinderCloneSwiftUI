//
//  NewMatchItem.swift
//  TinderCloneSwiftUI
//
//  Created by Oleksandr Isaiev on 22.04.2024.
//

import SwiftUI

struct NewMatchItem: View {

    let match: Match

    var body: some View {
        VStack {
            if let user = match.user {
                Image(user.profileImageURLs[0])
                    .resizable()
                    .scaledToFill()
                    .frame(width: 96, height: 120)
                    .clipShape(RoundedRectangle(cornerRadius: 10))

                Text(user.firstName)
                    .foregroundStyle(.primary)
                    .font(.subheadline)
                    .fontWeight(.semibold)
            }
        }
    }
}

#Preview {
    NewMatchItem(match: MockData.matches[1])
}
