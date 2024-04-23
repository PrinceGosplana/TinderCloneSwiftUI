//
//  GenderType.swift
//  TinderCloneSwiftUI
//
//  Created by Oleksandr Isaiev on 23.04.2024.
//


enum GenderType: Int, CaseIterable, Codable {
    case man, woman
}

extension GenderType: Identifiable {
    var id: Int { rawValue }
}

extension GenderType: CustomStringConvertible {
    var description: String {
        switch self {
        case .man:
            return "Man"
        case .woman:
            return "Woman"
        }
    }
}
