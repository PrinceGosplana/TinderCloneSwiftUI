//
//  EmailView.swift
//  TinderCloneSwiftUI
//
//  Created by Oleksandr Isaiev on 22.04.2024.
//

import SwiftUI

struct EmailView: View {

    @EnvironmentObject var authManager: AuthManager
    @EnvironmentObject var authDataStore: AuthDataStore

    var body: some View {
        NavigationStack {
            VStack {
                VStack(alignment: .leading, spacing: 16) {
                    Text("Your email?")
                        .fontWeight(.bold)
                        .font(.title)

                    Text(subtitle)
                        .font(.subheadline)
                        .foregroundStyle(.gray)

                    TextField("Enter email", text: $authDataStore.email)
                        .textInputAutocapitalization(.never)
                        .autocorrectionDisabled()
                        .keyboardType(.emailAddress)

                    Divider()
                }
                .padding()

                Spacer()

                NavigationLink {
                    PasswordView()
                } label: {
                    Text("Next")
                        .foregroundStyle(.white)
                        .font(.headline)
                        .frame(width: 340, height: 50)
                        .background(.primaryPink)
                        .clipShape(Capsule())
                }
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    BackChevronButton()
                }
            }
        }
    }
}

private extension EmailView {
    var subtitle: String {
        guard let authType = authManager.authType else { return "" }

        switch authType {
        case .createAccount:
            return "Don't lose access to your account, add your email"
        case .login:
            return "Enter the email associated with your account to log back in"
        }
    }
}

#Preview {
    EmailView()
}
