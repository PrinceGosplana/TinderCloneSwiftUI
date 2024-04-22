//
//  UserMatchView.swift
//  TinderCloneSwiftUI
//
//  Created by Oleksandr Isaiev on 22.04.2024.
//

import SwiftUI

struct UserMatchView: View {

    @Binding var show: Bool
    @EnvironmentObject var matchManager: MatchManager

    var body: some View {
        ZStack {
            Rectangle()
                .fill(.black.opacity(0.7))
                .ignoresSafeArea()

            VStack(spacing: 120) {
                VStack {
                    Image(.itsamatch)

                    if let matchedUser = matchManager.matchedUser {
                        Text("You and \(matchedUser.fullName) have liked each other.")
                            .foregroundStyle(.white)
                    }
                }

                HStack(spacing: 16) {
                    UserIcon(imageSting: MockData.users[0].profileImageURLs[0], size: 150)

                    if let matchedUser = matchManager.matchedUser {
                        UserIcon(imageSting: matchedUser.profileImageURLs[0], size: 150)
                    }
                }

                VStack(spacing: 16) {
                    Button("Send Message") {
                        show.toggle()
                    }
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundStyle(.white)
                    .frame(width: 350, height: 44)
                    .background(.secondaryPink)
                    .clipShape(Capsule())

                    Button("Keep Swiping") {
                        show.toggle()
                    }
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundStyle(.white)
                    .frame(width: 350, height: 44)
                    .background(.clear)
                    .clipShape(Capsule())
                    .overlay {
                        Capsule()
                            .stroke(.white, lineWidth: 1)
                            .shadow(radius: 4)
                    }

                }
            }
        }
    }
}

#Preview {
    UserMatchView(show: .constant(true))
        .environmentObject(MatchManager(service: MockMatchService()))
}
