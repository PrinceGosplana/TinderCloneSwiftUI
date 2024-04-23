//
//  WelcomeView.swift
//  TinderCloneSwiftUI
//
//  Created by Oleksandr Isaiev on 23.04.2024.
//

import SwiftUI

struct WelcomeView: View {

    @StateObject var onboardingManager = OnboardingManager()

    var body: some View {
        NavigationStack(path: $onboardingManager.navigationPath) {
            VStack(alignment: .leading, spacing: 24) {
                VStack(alignment: .leading, spacing: 8) {
                    Image(.tinderLogo)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 100, height: 64)

                    Text("Welcome to Tinder.")
                        .font(.title)
                        .fontWeight(.bold)

                    Text("Please follow these house rules.")
                        .font(.footnote)
                        .foregroundStyle(.gray)
                }

                WelcomeInfoItem(
                    title: "Be Yourself.",
                    subtitle: "Make sure your photos, age and bio are true to who you are."
                )

                WelcomeInfoItem(
                    title: "Stay safe.",
                    subtitle: "Don't be too quick to give out personal information"
                )

                WelcomeInfoItem(
                    title: "Play it cool.",
                    subtitle: "Respect others and treat themas you would like to be treated."
                )

                WelcomeInfoItem(
                    title: "Be proactive.",
                    subtitle: "Always report bad behaviour."
                )

                Spacer()

                Button {
                    onboardingManager.start()
                } label: {
                    Text("I agree")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundStyle(.white)
                        .frame(width: 350, height: 44)
                        .background(.primaryPink)
                        .clipShape(Capsule())

                }
            }
            .navigationDestination(for: OnboardingSteps.self, destination: { step in
                Group {
                    switch step {
                    case .name:
                        FullName()
                    case .birthday:
                        BirthdayView()
                    case .occupation:
                        Occupation()
                    case .gender:
                        GenderSelection()
                    case .sexualOrientation:
                        SexualOrientationSelection()
                    case .photos:
                        AddProfilePhotos()
                    }
                }
                .environmentObject(onboardingManager)
            })
            .padding()
        }
    }
}

#Preview {
    WelcomeView()
}

struct WelcomeInfoItem: View {

    let title: String
    let subtitle: String

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(title)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text(subtitle)
        }
    }
}
