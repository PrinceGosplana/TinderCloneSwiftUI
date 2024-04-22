//
//  MatchService.swift
//  TinderCloneSwiftUI
//
//  Created by Oleksandr Isaiev on 22.04.2024.
//

import SwiftUI

protocol MatchServiceProtocol {
    func fetchMatches() async throws -> [Match]
}

actor MatchService: MatchServiceProtocol {
    func fetchMatches() async throws -> [Match] {
        // fetch matches from service
        []
    }
}
