//
//  CardStackView.swift
//  SwiftUI-Tinder-Clone
//
//  Created by enesozmus on 26.04.2024.
//

import SwiftUI

struct CardStackView: View {
    
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
}

#Preview {
    CardStackView()
}
