//
//  InboxView.swift
//  TinderCloneSwiftUI
//
//  Created by Oleksandr Isaiev on 22.04.2024.
//

import SwiftUI

struct InboxView: View {
    var body: some View {
        NavigationStack {
            List {
                NewMatchesView()
            }
            .listStyle(PlainListStyle())
            .navigationTitle("Matches")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    InboxView()
}
