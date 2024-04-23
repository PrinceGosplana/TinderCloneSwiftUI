//
//  PasswordView.swift
//  TinderCloneSwiftUI
//
//  Created by Oleksandr Isaiev on 22.04.2024.
//

import SwiftUI

struct PasswordView: View {

    @EnvironmentObject var authManager: AuthManager
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var authDataStore: AuthDataStore

    var body: some View {
        VStack {
            VStack(alignment: .leading, spacing: 16) {
                Text("Your password?")
                    .fontWeight(.bold)
                    .font(.title)

                Text(subtitle)
                    .font(.subheadline)
                    .foregroundStyle(.gray)

                SecureField("Enter password", text: $authDataStore.password)
                    .textInputAutocapitalization(.never)
                    .autocorrectionDisabled()
                    .keyboardType(.emailAddress)

                Divider()
            }
            .navigationBarBackButtonHidden()
            .padding()

            Spacer()

            Button {
                onNextTapped()
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
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "chevron.left")
                        .imageScale(.large)
                        .fontWeight(.heavy)
                        .foregroundStyle(Color(.primaryText))
                }
            }
        }
    }
}

private extension PasswordView {
    var subtitle: String {
        guard let authType = authManager.authType else { return "" }

        switch authType {
        case .createAccount:
            return "Don't lose access to your account, add your password"
        case .login:
            return "Enter the password associated with your account to log back in"
        }
    }

    func onNextTapped() {
        Task {
            await authManager.authenticate(
                withEmail: authDataStore.email,
                password: authDataStore.password
            )
        }

    }
}

#Preview {
    PasswordView()
}
