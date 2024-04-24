//
//  AddProfilePhotos.swift
//  TinderCloneSwiftUI
//
//  Created by Oleksandr Isaiev on 23.04.2024.
//

import SwiftUI
import PhotosUI

struct AddProfilePhotos: View {

    @State private var selectedPhotoItems = [PhotosPickerItem]()
    @State private var profileImages = [Image]()

    var body: some View {
        VStack(spacing: 20) {
            VStack(alignment: .leading, spacing: 8) {
                Text("Add your recent pics")
                    .font(.title)
                    .fontWeight(.bold)

                Text("The first item will be your main profile picture.")
                    .font(.footnote)
            }
            .frame(maxWidth: .infinity, alignment: .leading)

            PhotosPicker(selection: $selectedPhotoItems, maxSelectionCount: maxSelectionCount) {
                LazyVGrid(columns: columns, spacing: 12) {
                    ForEach(0 ... maxSelectionCount - 1, id:\.self) { index in
                        if index < profileImages.count {
                            profileImages[index]
                                .resizable()
                                .scaledToFill()
                                .frame(width: 110, height: 160)
                                .clipShape(.rect(cornerRadius: 10))
                        } else {
                            ZStack(alignment: .bottomTrailing) {
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(Color(.secondarySystemBackground))
                                    .frame(width: 110, height: 160)

                                Image(systemName: "plus.circle.fill")
                                    .imageScale(.large)
                                    .foregroundStyle(Color(.primaryText))
                                    .offset(x: 8, y: 4)
                            }
                        }
                    }
                }
            }

            Spacer()

            HStack {
                ZStack {
                    Circle()
                        .stroke(Color(.systemGray3), lineWidth: 2)
                        .frame(width: 48, height: 48)

                    Text("\(selectedPhotoItems.count) / \(maxSelectionCount)")
                        .fontWeight(.semibold)
                }

                Text("Hey! Let's add 2 to start. We recommend a face pic.")
            }
            .font(.subheadline)


            NextButton()
        }
        .padding()
        .onChange(of: selectedPhotoItems) { oldValue, newValue in
            loadProfilePhotos()
        }
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                BackChevronButton()
            }
        }
        .navigationBarBackButtonHidden()
    }
}

private extension AddProfilePhotos {

    var maxSelectionCount: Int { 6 }

    var columns: [GridItem] {
        Array(repeating: .init(), count: 3)
    }

    func loadProfilePhotos() {
        Task {
            var images = [UIImage]()

            for item in selectedPhotoItems {
                guard let imageData = try? await item.loadTransferable(type: Data.self) else { return }
                guard let uiImage = UIImage(data: imageData) else { return }
                images.append(uiImage)

            }

            profileImages = images.map({ Image(uiImage: $0) })
        }
    }
}

#Preview {
    AddProfilePhotos()
}
