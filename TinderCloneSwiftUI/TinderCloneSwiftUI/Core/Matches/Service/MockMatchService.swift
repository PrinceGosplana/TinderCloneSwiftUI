//
//  MockMatchService.swift
//  TinderCloneSwiftUI
//
//  Created by Oleksandr Isaiev on 22.04.2024.
//

actor MockMatchService: MatchServiceProtocol {
    func fetchMatches() async throws -> [Match] {
        MockData.matches
    }
}
