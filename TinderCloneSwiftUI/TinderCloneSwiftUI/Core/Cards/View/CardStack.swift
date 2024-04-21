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
        ZStack {
            ForEach(viewModel.cardModels) { card in
                CardView()
            }
        }
    }
}

#Preview {
    CardStack()
}
