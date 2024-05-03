//
//  CardStackView.swift
//  SwiftUI-Tinder-Clone
//
//  Created by enesozmus on 26.04.2024.
//

import SwiftUI

struct CardStackView: View {
    
    @EnvironmentObject var matchManager: MatchManager
    @State private var showMatchView = false
    @StateObject var viewModel = CardsViewModel(service: CardsService())
    
    var body: some View {
        NavigationStack {
            ZStack {
                VStack(spacing: 16) {
                    ZStack {
                        ForEach(viewModel.cards) { card in
                            CardView(vm: viewModel, card: card)
                        }
                    }
                    if !viewModel.cards.isEmpty {
                        SwipeActionButtonsView(vm: viewModel)
                    }
                }
                .blur(radius: showMatchView ? 20 : 0)
                
                if showMatchView {
                    UserMatchView(show: $showMatchView)
                }
            }
            .onReceive(matchManager.$matchedUser) { user in
                showMatchView = user != nil
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Image(.tinderLogo)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 88)
                }
            }
        }
    }
}

#Preview {
    CardStackView()
        .environmentObject(MatchManager())
}
