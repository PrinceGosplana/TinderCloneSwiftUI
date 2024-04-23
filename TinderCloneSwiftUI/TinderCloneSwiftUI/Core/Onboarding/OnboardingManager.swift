//
//  OnboardingManager.swift
//  TinderCloneSwiftUI
//
//  Created by Oleksandr Isaiev on 23.04.2024.
//

import Foundation

final class OnboardingManager: ObservableObject {
    @Published var navigationPath = [OnboardingSteps]()

    private var currentStep: OnboardingSteps?

    func start() {
        guard let initialStep = OnboardingSteps(rawValue: 0) else { return }
        navigationPath.append(initialStep)
    }

    func navigate() {
        currentStep = navigationPath.last

        guard let index = currentStep?.rawValue else { return }
        guard let nextStep = OnboardingSteps(rawValue: index + 1) else { return }

        navigationPath.append(nextStep)
    }
}
