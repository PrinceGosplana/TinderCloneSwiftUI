//
//  NewMatchesView.swift
//  TinderCloneSwiftUI
//
//  Created by Oleksandr Isaiev on 22.04.2024.
//

import SwiftUI

struct NewMatchesView: View {

    @EnvironmentObject var matchManager: MatchManager

    var body: some View {
        VStack(alignment: .leading) {
            Text("New Matches")
                .font(.subheadline)
                .fontWeight(.semibold)

            ScrollView(.horizontal) {
                HStack(spacing: 12) {
                    if matchManager.matches.isEmpty {
                        ForEach(0 ..< 5) { index in
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color(.secondarySystemBackground))
                                .frame(width: 96, height: 120)
                        }
                    } else {
                        ForEach(matchManager.matches) { match in
                            NewMatchItem(match: match)
                        }
                    }
                }
            }
            .scrollIndicators(.hidden)
        }
        .task { await matchManager.fetchMatches() }
        .listRowSeparator(.hidden)
        .listRowInsets(EdgeInsets())
        .padding(.horizontal, 8)
        .padding(.top)
    }
}

#Preview {
    NewMatchesView()
        .environmentObject(MatchManager(service: MockMatchService()))
}
