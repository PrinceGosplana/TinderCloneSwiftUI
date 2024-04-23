//
//  AuthDataStore.swift
//  TinderCloneSwiftUI
//
//  Created by Oleksandr Isaiev on 23.04.2024.
//

import Foundation

final class AuthDataStore: ObservableObject {
    @Published var email = ""
    @Published var password = ""
}
