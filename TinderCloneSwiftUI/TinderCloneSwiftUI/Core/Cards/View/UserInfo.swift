//
//  UserInfo.swift
//  TinderCloneSwiftUI
//
//  Created by Oleksandr Isaiev on 20.04.2024.
//

import SwiftUI

struct UserInfo: View {

    @Binding var showProfileModal: Bool
    let user: User

    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(user.fullName)
                    .font(.title)
                    .fontWeight(.heavy)

                Text("\(user.age)")
                    .font(.title)
                    .fontWeight(.semibold)

                Spacer()

                Button {
                    showProfileModal.toggle()
                } label: {
                    Image(systemName: "arrow.up.circle")
                        .fontWeight(.bold)
                        .imageScale(.large)
                }
            }

            Text("bio")
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

#Preview {
    UserInfo(showProfileModal: .constant(false), user: MockData.users[1])
}
