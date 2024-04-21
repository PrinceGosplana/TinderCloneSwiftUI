//
//  CardService.swift
//  TinderCloneSwiftUI
//
//  Created by Oleksandr Isaiev on 21.04.2024.
//

struct CardService {
    func fetchCardModels() async throws -> [CardModel] {
        MockData.users.map { CardModel(user: $0) }
    }
}
