//
//  CardStackView.swift
//  SwiftUI-Tinder-Clone
//
//  Created by enesozmus on 26.04.2024.
//

import SwiftUI

struct CardStackView: View {
    
    @State private var showMatchView = true
    
    var body: some View {
        NavigationStack {
            ZStack {
                VStack(spacing: 16) {
                    ZStack {
                        ForEach(0 ..< 10) { card in
                            CardView()
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    CardStackView()
}
