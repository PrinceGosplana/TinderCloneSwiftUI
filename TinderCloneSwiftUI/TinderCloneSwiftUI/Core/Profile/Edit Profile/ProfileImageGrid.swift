//
//  ProfileImageGrid.swift
//  TinderCloneSwiftUI
//
//  Created by Oleksandr Isaiev on 22.04.2024.
//

import SwiftUI

struct ProfileImageGrid: View {

    let user: User

    var body: some View {
        LazyVGrid(columns: columns, spacing: 16) {
            ForEach(0 ..< 6) { index in
                if index < user.profileImageURLs.count {
                    Image(user.profileImageURLs[index])
                        .resizable()
                        .scaledToFill()
                        .frame(width: imageWidth, height: imageHeight)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                } else {
                    ZStack(alignment: .bottomTrailing) {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color(.secondarySystemBackground))
                            .frame(width: imageWidth, height: imageHeight)

                        Image(systemName: "plus.circle.fill")
                            .imageScale(.large)
                            .foregroundStyle(Color(.secondaryPink))
                            .offset(x: 4, y: 4)
                    }
                }
            }
        }
    }
}

private extension ProfileImageGrid {
    var columns: [GridItem] {
        [
            .init(.flexible()),
            .init(.flexible()),
            .init(.flexible())
        ]
    }

    var imageWidth: CGFloat { 110 }
    var imageHeight: CGFloat { 160 }
}

#Preview {
    ProfileImageGrid(user: MockData.users[2])
}
