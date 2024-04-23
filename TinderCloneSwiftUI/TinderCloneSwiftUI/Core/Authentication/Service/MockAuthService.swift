//
//  MockAuthService.swift
//  TinderCloneSwiftUI
//
//  Created by Oleksandr Isaiev on 23.04.2024.
//

import Foundation

actor MockAuthService: AuthServiceProtocol {
    func createUser(withEmail email: String, password: String) async throws -> String {
        NSUUID().uuidString
    }

    func login(withEmail email: String, password: String) async throws -> String {
        NSUUID().uuidString
    }

    func signOut() {

    }
}
