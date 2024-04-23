//
//  AuthService.swift
//  TinderCloneSwiftUI
//
//  Created by Oleksandr Isaiev on 23.04.2024.
//

import Foundation
import FirebaseAuth

actor AuthService: AuthServiceProtocol {
    func createUser(withEmail email: String, password: String) async throws -> String {
        let result = try await Auth.auth().createUser(withEmail: email, password: password)
        return result.user.uid
    }

    func login(withEmail email: String, password: String) async throws -> String {
        let result = try await Auth.auth().signIn(withEmail: email, password: password)
        return result.user.uid
    }

    func signOut() {
        do {
            try Auth.auth().signOut()
        } catch {
            print("Failed to signup with error \(error)")
        }
    }
}
