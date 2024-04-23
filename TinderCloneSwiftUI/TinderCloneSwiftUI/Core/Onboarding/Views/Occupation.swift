//
//  Occupation.swift
//  TinderCloneSwiftUI
//
//  Created by Oleksandr Isaiev on 23.04.2024.
//

import SwiftUI

struct Occupation: View {

    @State private var occupation = ""

    var body: some View {
        VStack {
            VStack(alignment: .leading, spacing: 20) {
                Text("What's your occupation?")
                    .font(.title)
                    .fontWeight(.bold)

                VStack(alignment: .leading) {
                    TextField("Enter your occupation", text: $occupation)

                    Divider()

                    VStack(alignment: .leading) {
                        Text("This is how it'll appear in your profile")

                        Text("Can't change it later.")
                            .font(.footnote)
                    }
                    .padding(.top, 8)
                    .fontWeight(.bold)

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
    }
}

#Preview {
    Occupation()
}
