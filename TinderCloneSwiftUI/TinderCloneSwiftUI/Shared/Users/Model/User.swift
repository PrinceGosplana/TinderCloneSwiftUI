//
//  User.swift
//  TinderCloneSwiftUI
//
//  Created by Oleksandr Isaiev on 21.04.2024.
//


struct User: Codable, Identifiable, Hashable {
    let id: String
    let fullName: String
    var age: Int
    var profileImageURLs: [String]
}

extension User {
    var firstName: String {
        let components = fullName.components(separatedBy: " ")
        return components[0]
    }
}
