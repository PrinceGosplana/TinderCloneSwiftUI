//
//  EditProfile.swift
//  TinderCloneSwiftUI
//
//  Created by Oleksandr Isaiev on 22.04.2024.
//

import SwiftUI

struct EditProfile: View {

    @Environment(\.dismiss) var dismiss
    @State private var bio = ""
    @State private var occupation = ""
    let user: User

    var body: some View {
        NavigationStack {
            ScrollView {
                ProfileImageGrid(user: user)
                    .padding()

                VStack(spacing: 24) {
                    VStack(alignment: .leading) {
                        Text("ABOUT ME")
                            .font(.subheadline)
                            .fontWeight(.bold)
                            .padding(.leading)

                        TextField("Add your bio", text: $bio, axis: .vertical)
                            .padding()
                            .frame(height: 64, alignment: .top)
                            .background(Color(.secondarySystemBackground))
                            .font(.subheadline)
                    }

                    VStack(alignment: .leading) {
                        Text("OCCUPATION")
                            .font(.subheadline)
                            .fontWeight(.bold)
                            .padding(.leading)

                        HStack {
                            Image(systemName: "book")
                            Text("Occupation")

                            Spacer()

                            Text(occupation)
                                .font(.footnote)
                        }
                        .padding()
                        .background(Color(.secondarySystemBackground))
                        .font(.subheadline)
                    }

                    EditProfileCell(title: "GENDER", value: "Man")

                    EditProfileCell(title: "SEXUAL ORIENTATION", value: "Straight")
                }


            }
            .scrollIndicators(.hidden)
            .navigationTitle("Edit Profile")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                }

                ToolbarItem(placement: .topBarTrailing) {
                    Button("Done") {
                        dismiss()
                    }
                    .fontWeight(.semibold)
                }
            }
        }
    }
}

#Preview {
    EditProfile(user: MockData.users[2])
}
