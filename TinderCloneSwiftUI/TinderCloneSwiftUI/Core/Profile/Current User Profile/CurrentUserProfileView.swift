//
//  CurrentUserProfileView.swift
//  TinderCloneSwiftUI
//
//  Created by Oleksandr Isaiev on 22.04.2024.
//

import SwiftUI

struct CurrentUserProfileView: View {

    @EnvironmentObject var authManager: AuthManager
    @State private var showEditProfile = false
    let user: User

    var body: some View {
        NavigationStack {
            List {
                // header view
                CurrentUserProfileHeader(user: user)
                    .onTapGesture { showEditProfile.toggle() }
                // account info
                Section("Account Information") {
                    HStack {
                        Text("Name")

                        Spacer()

                        Text(user.fullName)
                    }

                    HStack {
                        Text("Email")

                        Spacer()

                        Text("test")
                    }
                }

                // legal

                Section("Legal") {
                    Text("Terms of Service")
                }

                // logout/delete

                Section {
                    Button("Log out") {
                        Task { await authManager.signOut() }
                    }
                    .foregroundStyle(.red)
                }

                Section {
                    Button("Delete Account") {

                    }.foregroundStyle(.red)
                }

            }
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
            .fullScreenCover(isPresented: $showEditProfile) {
                EditProfile(user: user)
            }
        }
    }
}

#Preview {
    CurrentUserProfileView(user: MockData.users[1])
}
