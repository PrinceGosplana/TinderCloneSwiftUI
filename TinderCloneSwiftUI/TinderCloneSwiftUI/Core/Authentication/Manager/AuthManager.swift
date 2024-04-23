//
//  AuthManager.swift
//  TinderCloneSwiftUI
//
//  Created by Oleksandr Isaiev on 23.04.2024.
//

import FirebaseAuth

enum AuthType: Int, Identifiable {
    case createAccount, login

    var id: Int { rawValue }
}

enum AuthState {
    case unauthenticated
    case authenticated(String)
}

@MainActor
final class AuthManager: ObservableObject {

    @Published var authType: AuthType?
    @Published var authState: AuthState = .unauthenticated
    private let service: AuthServiceProtocol

    init(service: AuthServiceProtocol) {
        self.service = service

        if let currentUid = Auth.auth().currentUser?.uid {
            authState = .authenticated(currentUid)
        }
    }

    func authenticate(withEmail email: String, password: String) async {
        guard let authType else { return }

        do {
            switch authType {
            case .createAccount:
                let uid = try await service.createUser(withEmail: email, password: password)
                authState = .authenticated(uid)
            case .login:
                let uid = try await service.login(withEmail: email, password: password)
                authState = .authenticated(uid)
            }
        } catch {
            print("Failed to auth with error \(error.localizedDescription)")
        }
    }

    func signOut() async {
        authState = .unauthenticated
        authType = nil
        await service.signOut()
    }
}
