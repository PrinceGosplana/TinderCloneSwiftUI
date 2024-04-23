//
//  AuthenticationRootView.swift
//  TinderCloneSwiftUI
//
//  Created by Oleksandr Isaiev on 22.04.2024.
//

import SwiftUI

struct AuthenticationRootView: View {

    @EnvironmentObject var authManager: AuthManager

    var body: some View {
        NavigationStack {
            VStack {
                Image(.tinderLogoWhite)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100, height: 40)
                    .padding()

                VStack(spacing: 8) {
                    Text("It Starts ").bold() +
                    Text("with")

                    Text("a ") +
                    Text("Swipe").bold()
                }
                .font(.largeTitle)
                .foregroundStyle(.white)

                Spacer()

                VStack(spacing: 20) {
                    Text("By tapping 'Sign in' you agree to our Terms. Learn how we process your data in our Privacy Policy and Cookies Policy")
                        .multilineTextAlignment(.center)
                        .font(.footnote)
                        .foregroundStyle(.white)

                    Button {
                        authManager.authType = .createAccount
                    } label: {
                        Text("Create Account")
                            .font(.headline)
                            .foregroundStyle(.black)
                            .frame(width: 340, height: 50)
                            .background(.white)
                            .clipShape(Capsule())
                    }

                    Button {
                        authManager.authType = .login
                    } label: {
                        Text("Sign In")
                            .font(.headline)
                            .foregroundStyle(.white)
                            .frame(width: 340, height: 50)
                            .overlay {
                                Capsule()
                                    .stroke(.white, lineWidth: 1.5)
                            }
                    }

                    NavigationLink {

                    } label: {
                        Text("Trouble signing in?")
                            .font(.headline)
                            .foregroundStyle(.white)
                    }
                }
            }
            .fullScreenCover(item: $authManager.authType) { type in
                EmailView()
            }
            .frame(maxWidth: .infinity)
            .background(gradientBackground)
        }
    }
}

private extension AuthenticationRootView {
    var gradientBackground: LinearGradient {
        LinearGradient(
            colors: [
                Color(.tertiaryPink),
                Color(.primaryPink),
                Color(.secondaryPink)
            ],
            startPoint: .topTrailing,
            endPoint: .bottomLeading
        )
    }
}
#Preview {
    AuthenticationRootView()
        .environmentObject(AuthManager(service: MockAuthService()))
}
