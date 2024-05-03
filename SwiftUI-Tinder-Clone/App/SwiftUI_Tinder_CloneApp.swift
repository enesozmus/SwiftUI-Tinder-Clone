//
//  SwiftUI_Tinder_CloneApp.swift
//  SwiftUI-Tinder-Clone
//
//  Created by enesozmus on 24.04.2024.
//

import SwiftUI

@main
struct SwiftUI_Tinder_CloneApp: App {
    
    @StateObject var matchManager = MatchManager()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(matchManager)
        }
    }
}
