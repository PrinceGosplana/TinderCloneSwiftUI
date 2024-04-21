//
//  CardModel.swift
//  TinderCloneSwiftUI
//
//  Created by Oleksandr Isaiev on 21.04.2024.
//

struct CardModel {
    let user: User
}

extension CardModel: Identifiable {
    var id: String { return user.id }
}
