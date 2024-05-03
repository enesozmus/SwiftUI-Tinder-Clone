//
//  ContentView.swift
//  SwiftUI-Tinder-Clone
//
//  Created by enesozmus on 24.04.2024.
//

import SwiftUI

struct ContentView: View {
    let nTest = true
    var body: some View {
        if nTest {
            LoginView()
        } else {
            MainTabView()
        }
    }
}

#Preview {
    ContentView()
}
