//
//  CardView.swift
//  SwiftUI-Tinder-Clone
//
//  Created by enesozmus on 24.04.2024.
//

import SwiftUI

struct CardView: View {
    
    @EnvironmentObject var matchManager: MatchManager
    @ObservedObject var vm: CardsViewModel
    @State private var xOffset: CGFloat = 0
    @State private var degrees: Double = 0
    @State private var currentImageIndex = 0
    @State private var showProfileSheet: Bool = false
    
    let card: Card
    
    var body: some View {
        ZStack(alignment: .bottom) {
            ZStack(alignment: .top) {
                Image(user.profileImageURLs[currentImageIndex])
                    .resizable()
                    .scaledToFill()
                    .frame(width: SizeConstants.cardWidth, height: SizeConstants.cardHeight)
                    .overlay {
                        ImageScrollingOverlayView(currentImageIndex: $currentImageIndex, imageCount: imageCount)
                    }
                CardImageIndicatorView(currentImageIndex: currentImageIndex, imageCount: imageCount)
                SwipeActionIndicatorView(xOffset: $xOffset)
            }
            
            UserInfoView(showProfileSheet: $showProfileSheet, user: user)
        }
        .fullScreenCover(isPresented: $showProfileSheet) {
            UserProfileView(user: user)
        }
        .onReceive(vm.$buttonSwipeAction, perform: { action in
            onReceiveSwipeAction(action)
        })
        .frame(width: SizeConstants.cardWidth, height: SizeConstants.cardHeight)
        .clipShape(RoundedRectangle(cornerRadius: 25))
        .offset(x: xOffset)
        .rotationEffect(.degrees(degrees))
        .animation(.snappy, value: xOffset)
        .gesture(
            DragGesture()
                .onChanged(onDragChanged)
                .onEnded(onDragEnded)
        )
    }
}

private extension CardView {
    
    // ...
    func onDragChanged(_ value: _ChangedGesture<DragGesture>.Value) {
        xOffset = value.translation.width
        degrees = Double(value.translation.width / 25)
    }
    
    // ...
    func onDragEnded(_ value: _ChangedGesture<DragGesture>.Value) {
        let width = value.translation.width
        
        if abs(width) <= abs(SizeConstants.screenCutoff) {
            returnToCenter()
            return
        }
        
        if width >= SizeConstants.screenCutoff {
            swipeRight()
        } else {
            swipeLeft()
        }
    }
    
    // ...
    func returnToCenter() {
        xOffset = 0;
        degrees = 0;
    }
    func swipeRight() {
        withAnimation {
            xOffset = 500
            degrees = 12
        } completion: {
            vm.removeCard(card)
            matchManager.checkForMatch(withUser: user)
        }
    }
    
    func swipeLeft() {
        withAnimation {
            xOffset = -500
            degrees = -12
        } completion: {
            vm.removeCard(card)
        }
    }
    
    // ...
    var user: User {
        return card.user
    }
    var imageCount: Int {
        return user.profileImageURLs.count
    }
    
    // ...
    func onReceiveSwipeAction(_ action: SwipeAction?) {
        guard let action else { return }
        let topCard = vm.cards.last
        
        if topCard == card {
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
}

#Preview {
    CardView(
        vm: CardsViewModel(service: CardsService()),
        card: Card(user: MockData.users[4]))
}
