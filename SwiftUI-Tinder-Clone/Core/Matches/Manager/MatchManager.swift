//
//  MatchManager.swift
//  SwiftUI-Tinder-Clone
//
//  Created by enesozmus on 2.05.2024.
//

import Foundation

@MainActor
class MatchManager: ObservableObject {
    
    @Published var matchedUser: User?
    
    func checkForMatch(withUser user: User) {
        let didMatch = Bool.random()
        
        if didMatch {
            matchedUser = user
        }
    }
}
