//
//  CardView.swift
//  TinderCloneSwiftUI
//
//  Created by Oleksandr Isaiev on 20.04.2024.
//

import SwiftUI

struct CardView: View {

    @EnvironmentObject var matchManager: MatchManager
    @ObservedObject var viewModel: CardsViewModel
    
    @State private var xOffset: CGFloat = 0
    @State private var degrees: Double = 0
    @State private var currentImageIndex = 0
    @State private var showProfileModel = false
    
    let model: CardModel

    var body: some View {
        ZStack(alignment: .bottom) {
            ZStack(alignment: .top) {
                Image(user.profileImageURLs[currentImageIndex])
                    .resizable()
                    .scaledToFill()
                    .frame(width: SizeConstants.cardWidth, height: SizeConstants.cardHeight)
                    .overlay {
                        ImageScrollingOverlay(
                            currentImageIndex: $currentImageIndex,
                            imageCount: imageCount
                        )
                    }

                CardImageIndicator(
                    currentImageIndex: currentImageIndex,
                    imageCount: imageCount
                )

                SwipeActionIndicator(xOffset: $xOffset)
            }

            UserInfo(showProfileModal: $showProfileModel, user: user)
        }
        .fullScreenCover(isPresented: $showProfileModel) {
            UserProfileView(user: user)
        }
        .onReceive(viewModel.$buttonSwipeAction, perform: { action in
            onReceiveSwipeAction(action)
        })
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
    var user: User {
        model.user
    }

    var imageCount: Int {
        user.profileImageURLs.count
    }
}

private extension CardView {

    func returnToCenter() {
        xOffset = 0
        degrees = 0
    }

    func swipeRight() {
        if #available(iOS 17.0, *) {
            withAnimation {
                xOffset = 500
                degrees = 12
            } completion: {
                viewModel.removeCard(model)
                matchManager.checkForMatch(withUser: user)
            }
        } else {
            xOffset = 500
            degrees = 12
            viewModel.removeCard(model)
        }
    }

    func swipeLeft() {
        if #available(iOS 17.0, *) {
            withAnimation {
                xOffset = -500
                degrees = -12
            } completion: {
                viewModel.removeCard(model)
            }
        } else {
            xOffset = -500
            degrees = -12
            viewModel.removeCard(model)
        }
    }

    func onReceiveSwipeAction(_ action: SwipeAction?) {
        guard let action else { return }

        let topCard = viewModel.cardModels.last

        if topCard == model {
            switch action {
            case .reject:
                swipeLeft()
            case .like:
                swipeRight()
            }
        }
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
            return
        }

        if width >= SizeConstants.screenCutoff {
            swipeRight()
        } else {
            swipeLeft()
        }
    }
}

#Preview {
    CardView(
        viewModel: CardsViewModel(service: CardService()),
        model: CardModel(user: MockData.users[1])
    )
}
