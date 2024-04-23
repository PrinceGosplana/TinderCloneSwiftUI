//
//  BirthdayView.swift
//  TinderCloneSwiftUI
//
//  Created by Oleksandr Isaiev on 23.04.2024.
//

import SwiftUI

struct BirthdayView: View {

    @State private var birthday = Date()

    var body: some View {
        VStack {
            VStack(alignment: .leading, spacing: 20) {
                Text("When's your full name?")
                    .font(.title)
                    .fontWeight(.bold)

                VStack(alignment: .leading) {
                    DatePicker(
                        "Select Date",
                        selection: $birthday,
                        displayedComponents: [.date]
                    )
                    .datePickerStyle(GraphicalDatePickerStyle())

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
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                BackChevronButton()
            }
        }
        .padding()
    }
}

#Preview {
    BirthdayView()
}
