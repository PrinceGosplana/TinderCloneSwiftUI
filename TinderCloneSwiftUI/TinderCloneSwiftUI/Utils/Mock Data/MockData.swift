//
//  MockData.swift
//  TinderCloneSwiftUI
//
//  Created by Oleksandr Isaiev on 21.04.2024.
//

import Foundation

struct MockData {

    static let users: [User] = [
        .init(
            id: NSUUID().uuidString,
            fullName: "Megan Fox",
            age: 37,
            profileImageURLs: ["megan-fox-1", "megan-fox-2"]
        ),
        .init(
            id: NSUUID().uuidString,
            fullName: "David Beckham",
            age: 48,
            profileImageURLs: ["david-beckham-1", "david-beckham-2"]
        ),
        .init(
            id: NSUUID().uuidString,
            fullName: "Conor McGregor",
            age: 35,
            profileImageURLs: ["conor-mcgregor-1", "conor-mcgregor-2", "conor-mcgregor-3"]
        )
    ]
}
