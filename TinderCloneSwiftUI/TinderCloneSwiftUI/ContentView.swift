//
//  ContentView.swift
//  TinderCloneSwiftUI
//
//  Created by Oleksandr Isaiev on 19.04.2024.
//

import SwiftUI

struct ContentView: View {

    @EnvironmentObject var authManager: AuthManager

    var body: some View {
        Group {
            switch authManager.authState {
            case .unauthenticated:
                AuthenticationRootView()
                    .environmentObject(AuthDataStore())
            case .authenticated:
                MainTabView()
            }
        }
    }
}

#Preview {
    ContentView()
}
