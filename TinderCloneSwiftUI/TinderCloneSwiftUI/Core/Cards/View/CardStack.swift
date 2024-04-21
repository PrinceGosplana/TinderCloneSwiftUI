//
//  CardStack.swift
//  TinderCloneSwiftUI
//
//  Created by Oleksandr Isaiev on 21.04.2024.
//

import SwiftUI

struct CardStack: View {

    @StateObject var viewModel = CardsViewModel(service: CardService())

    var body: some View {
        VStack(spacing: 16) {
            ZStack {
                ForEach(viewModel.cardModels) { card in
                    CardView(viewModel: viewModel, model: card)
                }
            }
            if !viewModel.cardModels.isEmpty {
                SwipeActionButtons(viewModel: viewModel)
            }
        }
    }
}

#Preview {
    CardStack()
}
