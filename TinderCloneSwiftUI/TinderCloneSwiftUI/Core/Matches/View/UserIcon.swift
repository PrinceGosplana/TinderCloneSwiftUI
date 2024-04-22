//
//  UserIcon.swift
//  TinderCloneSwiftUI
//
//  Created by Oleksandr Isaiev on 22.04.2024.
//

import SwiftUI

struct UserIcon: View {

    let imageSting: String
    let size: CGFloat

    var body: some View {
        Image(imageSting)
            .resizable()
            .scaledToFill()
            .frame(width: size, height: size)
            .clipShape(Circle())
            .overlay {
                Circle()
                    .stroke(.white, lineWidth: 2)
                    .shadow(radius: 4)
            }
    }
}

#Preview {
    UserIcon(imageSting: MockData.users[0].profileImageURLs[0], size: 150)
}
