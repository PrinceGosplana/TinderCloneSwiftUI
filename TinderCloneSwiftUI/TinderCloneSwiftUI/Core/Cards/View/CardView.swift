//
//  CardView.swift
//  TinderCloneSwiftUI
//
//  Created by Oleksandr Isaiev on 20.04.2024.
//

import SwiftUI

struct CardView: View {

    @State private var xOffset: CGFloat = 0
    @State private var degrees: Double = 0

    var body: some View {
        ZStack(alignment: .bottom) {
            ZStack(alignment: .top) {
                Image(.meganFox1)
                    .resizable()
                .scaledToFill()

                SwipeActionIndicator(xOffset: $xOffset)
            }

            UserInfo()
                .padding(.horizontal)
        }
        .frame(width: SizeConstants.cardWidth, height: SizeConstants.cardHeight)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .offset(x: xOffset)
        .rotationEffect(.degrees(degrees))
        .animation(.snappy, value: xOffset)
        .gesture(
            DragGesture()
                .onChanged(onDragChanges)
                .onEnded(onDragEnded)
        )
    }
}

private extension CardView {

    func onDragChanges(_ value: _ChangedGesture<DragGesture>.Value) {
        xOffset = value.translation.width
        degrees = Double(value.translation.width / 25)
    }

    func onDragEnded(_ value: _ChangedGesture<DragGesture>.Value) {
        let width = value.translation.width
        if abs(width) <= abs(SizeConstants.screenCutoff) {
            xOffset = 0
            degrees = 0
        }
    }
}

#Preview {
    CardView()
}
