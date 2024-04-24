//
//  FullName.swift
//  TinderCloneSwiftUI
//
//  Created by Oleksandr Isaiev on 23.04.2024.
//

import SwiftUI

struct FullName: View {

    @State private var fullName = ""

    var body: some View {
        VStack {
            VStack(alignment: .leading, spacing: 20) {
                Text("What's your full name?")
                    .font(.title)
                    .fontWeight(.bold)

                VStack(alignment: .leading) {
                    TextField("Enter full Name", text: $fullName)

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
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    NavigationStack {
        FullName()
    }
}
