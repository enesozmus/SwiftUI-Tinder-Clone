//
//  MockData.swift
//  SwiftUI-Tinder-Clone
//
//  Created by enesozmus on 26.04.2024.
//

import Foundation

struct MockData {
    
    static let users: [User] = [
        .init(
            id: UUID().uuidString,
            fullname: "Jane",
            age: 47,
            profileImageURLs: [
                "jane1",
                "jane2",
                "jane3"
            ]
        ),
        .init(
            id: UUID().uuidString,
            fullname: "Alisa",
            age: 22,
            profileImageURLs: [
                "alisa1",
                "alisa2",
                "alisa3"
            ]
        ),
        .init(
            id: UUID().uuidString,
            fullname: "David",
            age: 48,
            profileImageURLs: [
                "david-beckham-1",
                "david-beckham-2"
            ]
        ),
        .init(
            id: UUID().uuidString,
            fullname: "Angelina",
            age: 48,
            profileImageURLs: [
                "angelina-1",
                "angelina-2"
            ]
        ),
        .init(
            id: UUID().uuidString,
            fullname: "Margot",
            age: 33,
            profileImageURLs: [
                "margot-1",
                "margot-2"
            ]
        ),
        .init(
            id: UUID().uuidString,
            fullname: "Conor",
            age: 35,
            profileImageURLs: [
                "conor-mcgregor-1",
                "conor-mcgregor-2"
            ]
        ),
        .init(
            id: UUID().uuidString,
            fullname: "Scarlett",
            age: 39,
            profileImageURLs: [
                "scarlet-1",
                "scarlet-2",
                "scarlet-3"
            ]
        )
    ]
    
}
