//
//  CardService.swift
//  SwiftUI-Tinder-Clone
//
//  Created by enesozmus on 26.04.2024.
//

import Foundation

struct CardsService {
    
    func fetchCards() async throws -> [Card] {
        let users = MockData.users
        return users.map { user in
            Card(user: user)
        }
    }
}
