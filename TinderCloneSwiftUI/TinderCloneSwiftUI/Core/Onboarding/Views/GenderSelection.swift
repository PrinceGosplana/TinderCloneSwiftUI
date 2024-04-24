//
//  GenderSelection.swift
//  TinderCloneSwiftUI
//
//  Created by Oleksandr Isaiev on 23.04.2024.
//

import SwiftUI


struct GenderSelection: View {

    @State private var selectedGender: GenderType?

    var body: some View {
        VStack(spacing: 20) {
            VStack(alignment: .leading, spacing: 12) {
                Text("What's your gender?")
                    .font(.title)
                    .fontWeight(.bold)

                Text("We value and support diversity and inclusion of all genders. We will add more options to include everyone soon.")
                    .font(.subheadline)
            }

            ForEach(GenderType.allCases) { gender in
                Button {
                    selectedGender = gender
                } label: {
                    Text("\(gender.description)")
                        .foregroundStyle(Color(.primaryText))
                        .frame(width: 300, height: 50)
                        .overlay(RoundedRectangle(cornerRadius: 25.0)
                        .stroke(selectedGender == gender ? .red : .gray, lineWidth: 1.5))
                }
            }

            Spacer()

            NextButton()
        }
        .padding()
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                BackChevronButton()
            }
        }
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    GenderSelection()
}
