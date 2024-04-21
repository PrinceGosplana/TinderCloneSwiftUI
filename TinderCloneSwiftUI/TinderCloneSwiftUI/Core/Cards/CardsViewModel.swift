//
//  CardsViewModel.swift
//  TinderCloneSwiftUI
//
//  Created by Oleksandr Isaiev on 21.04.2024.
//

import SwiftUI

@MainActor
final class CardsViewModel: ObservableObject {
    @Published var cardModels = [CardModel]()

    private let service: CardService

    init(service: CardService) {
        self.service = service

        Task { await fetchCardModels() }
    }

    func fetchCardModels() async {
        do {
            cardModels = try await service.fetchCardModels()
        } catch {
            print("Failed to fetch cards with error \(error.localizedDescription)")
        }
    }

    func removeCard(_ card: CardModel) {
        guard let index = cardModels.firstIndex(where: { $0.id == card.id }) else { return }
        cardModels.remove(at: index)
    }
}
