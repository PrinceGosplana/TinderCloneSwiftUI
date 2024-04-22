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
            fullName: "Kelly Johnson",
            age: 33,
            profileImageURLs: ["kelly1", "kelly2", "kelly3"]
        ),
        .init(
            id: NSUUID().uuidString,
            fullName: "Jane Doe",
            age: 27,
            profileImageURLs: ["jane1", "jane2", "jane3"]
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

extension MockData {
    static var matches: [Match] = [
        .init(
            id: NSUUID().uuidString,
            userId: users[0].id,
            timestamp: Date(),
            user: users[0]
        ),
        .init(
            id: NSUUID().uuidString,
            userId: users[2].id,
            timestamp: Date(),
            user: users[2]
        ),
        .init(
            id: NSUUID().uuidString,
            userId: users[4].id,
            timestamp: Date(),
            user: users[4]
        ),
    ]
}
