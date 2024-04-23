//
//  ContentView.swift
//  TinderCloneSwiftUI
//
//  Created by Oleksandr Isaiev on 19.04.2024.
//

import SwiftUI

struct ContentView: View {

    @EnvironmentObject var authManager: AuthManager
    @State private var didCompleteOnboarding = false

    var body: some View {
        Group {
            switch authManager.authState {
            case .unauthenticated:
                AuthenticationRootView()
                    .environmentObject(AuthDataStore())
            case .authenticated:
                if didCompleteOnboarding {
                    MainTabView()
                } else {
                    WelcomeView()
                }
            }
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(AuthManager(service: MockAuthService()))
}
