//
//  CardView.swift
//  TinderCloneSwiftUI
//
//  Created by Oleksandr Isaiev on 20.04.2024.
//

import SwiftUI

struct CardView: View {

    var body: some View {
        ZStack(alignment: .bottom) {
            Image(.meganFox1)
                .resizable()
                .scaledToFill()
                .frame(width: cardWidth, height: cardHeight)
                .clipShape(RoundedRectangle(cornerRadius: 10))

            UserInfo()
        }
    }
}

private extension CardView {
    var cardWidth: CGFloat {
        UIScreen.main.bounds.width - 20
    }
    
    var cardHeight: CGFloat {
        UIScreen.main.bounds.height / 1.45
    }
}

#Preview {
    CardView()
}
