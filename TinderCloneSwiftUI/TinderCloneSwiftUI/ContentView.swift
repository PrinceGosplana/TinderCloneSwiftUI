//
//  ContentView.swift
//  TinderCloneSwiftUI
//
//  Created by Oleksandr Isaiev on 19.04.2024.
//

import SwiftUI

struct ContentView: View {

    @StateObject var matchManager = MatchManager(service: MatchService())
    var body: some View {
        MainTabView()
            .environmentObject(matchManager)
    }
}

#Preview {
    ContentView()
}
