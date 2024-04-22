//
//  Match.swift
//  TinderCloneSwiftUI
//
//  Created by Oleksandr Isaiev on 22.04.2024.
//

import SwiftUI

struct Match: Codable, Identifiable, Hashable {
    let id: String
    let userId: String
    let timestamp: Date

    var user: User?
}
