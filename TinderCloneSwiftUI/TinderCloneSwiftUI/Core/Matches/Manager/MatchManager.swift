//
//  MatchManager.swift
//  TinderCloneSwiftUI
//
//  Created by Oleksandr Isaiev on 22.04.2024.
//
import SwiftUI

@MainActor
final class MatchManager: ObservableObject {

    @Published var matchedUser: User?
    @Published var matches = [Match]()

    private let service: MatchServiceProtocol

    init(service: MatchServiceProtocol) {
        self.service = service
    }

    func fetchMatches() async {
        do {
            matches = try await service.fetchMatches()
        } catch {
            print("Failed to fetch matches with error \(error.localizedDescription)")
        }
    }

    func checkForMatch(withUser user: User)  {
        if Bool.random() {
            matchedUser = user
        }
    }
}
