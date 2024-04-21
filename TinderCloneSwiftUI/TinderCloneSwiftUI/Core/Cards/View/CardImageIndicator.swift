//
//  CardImageIndicator.swift
//  TinderCloneSwiftUI
//
//  Created by Oleksandr Isaiev on 21.04.2024.
//

import SwiftUI

struct CardImageIndicator: View {

    let currentImageIndex: Int
    let imageCount: Int

    var body: some View {
        HStack {
            ForEach(0 ..< imageCount, id: \.self) { index in
                Capsule()
                    .foregroundStyle( currentImageIndex == index ? .white : .gray)
                    .frame(width: imageIndicatorWidth, height: 4)
                    .padding(.top, 8)
            }
        }
    }
}

private extension CardImageIndicator {
    var imageIndicatorWidth: CGFloat {
        SizeConstants.cardWidth / CGFloat(imageCount) - 28
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    CardImageIndicator(currentImageIndex: 1, imageCount: 3)
        .preferredColorScheme(.dark)
}
