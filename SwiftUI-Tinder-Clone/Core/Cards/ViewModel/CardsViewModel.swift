//
//  CardsViewModel.swift
//  SwiftUI-Tinder-Clone
//
//  Created by enesozmus on 26.04.2024.
//

import Foundation

@MainActor
class CardsViewModel: ObservableObject {
    
    @Published var cards = [Card]()
    @Published var buttonSwipeAction: SwipeAction?
    
    private let service: CardsService
    
    init(service: CardsService) {
        self.service = service
        Task {
            await fetchCards()
        }
    }
    
    func fetchCards() async {
        do {
            self.cards = try await service.fetchCards()
        } catch {
            print("failed to fetch cards: \(error)")
        }
    }
    
    func removeCard(_ card: Card) {
        guard let index = cards.firstIndex(where: { $0.id == card.id }) else { return }
        cards.remove(at: index)
    }
}
