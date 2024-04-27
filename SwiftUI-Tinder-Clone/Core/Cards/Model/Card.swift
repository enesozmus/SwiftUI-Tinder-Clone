//
//  CardModel.swift
//  SwiftUI-Tinder-Clone
//
//  Created by enesozmus on 26.04.2024.
//

import Foundation

struct Card: Identifiable, Hashable {
    
    let user: User
    
    var id: String {
        return user.id
    }
}
