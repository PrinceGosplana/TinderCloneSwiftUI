//
//  SexualOrientationSelection.swift
//  TinderCloneSwiftUI
//
//  Created by Oleksandr Isaiev on 23.04.2024.
//

import SwiftUI

struct SexualOrientationSelection: View {

    @State private var sexualOrientation: SexualOrientationType?

    var body: some View {
        VStack {
            VStack(alignment: .leading, spacing: 20) {
                Text("What's your sexual orientation?")
                    .font(.title)
                    .fontWeight(.bold)

                VStack(alignment: .leading, spacing: 20) {
                    ForEach(SexualOrientationType.allCases) { orientation in
                        Button {
                            sexualOrientation = orientation
                        } label: {
                            HStack {
                                Text(orientation.description)

                                Spacer()

                                if sexualOrientation == orientation {
                                    Image(systemName: "checkmark")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 14, height: 14)
                                }
                            }
                            .foregroundStyle(.primaryText)
                        }
                    }
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
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    SexualOrientationSelection()
}
