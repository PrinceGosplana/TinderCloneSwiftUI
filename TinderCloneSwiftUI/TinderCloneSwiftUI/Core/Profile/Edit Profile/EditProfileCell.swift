//
//  EditProfileCell.swift
//  TinderCloneSwiftUI
//
//  Created by Oleksandr Isaiev on 22.04.2024.
//

import SwiftUI

struct EditProfileCell: View {

    let title: String
    let value: String

    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.subheadline)
                .fontWeight(.bold)
                .padding(.leading)

            HStack {
                Text(value)

                Spacer()

                Image(systemName: "chevron.right")
                    .imageScale(.small)
            }
            .padding()
            .background(Color(.secondarySystemBackground))
            .font(.subheadline)
        }
    }
}


#Preview {
    EditProfileCell(title: "Test Title", value: "Test Info")
}
