//
//  MainTabView.swift
//  TinderCloneSwiftUI
//
//  Created by Oleksandr Isaiev on 20.04.2024.
//

import SwiftUI

enum TabbarType: Int {
    case swiping, search, inbox, profile
}

struct MainTabView: View {
    var body: some View {
        TabView {
            CardStack()
                .tabItem { Image(systemName: "flame") }
                .tag(TabbarType.swiping)

            Text("Search View")
                .tabItem { Image(systemName: "magnifyingglass") }
                .tag(TabbarType.search)

            InboxView()
                .tabItem { Image(.messagesIcon)
                        .renderingMode(.template)
                }
                .tag(TabbarType.inbox)

            CurrentUserProfileView(user: MockData.users[2])
                .tabItem { Image(systemName: "person") }
                .tag(TabbarType.profile)
        }
        .tint(.primary)
    }
}

#Preview {
    MainTabView()
        .environmentObject(MatchManager(service: MockMatchService()))
}
