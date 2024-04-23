//
//  OnboardingSteps.swift
//  TinderCloneSwiftUI
//
//  Created by Oleksandr Isaiev on 23.04.2024.
//

import Foundation

enum OnboardingSteps: Int, CaseIterable {
    case name, birthday, occupation, gender, sexualOrientation, photos
}

extension OnboardingSteps: Identifiable, Hashable {
    var id: Int { rawValue }
}
