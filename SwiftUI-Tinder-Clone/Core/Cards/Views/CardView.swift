//
//  CardView.swift
//  SwiftUI-Tinder-Clone
//
//  Created by enesozmus on 24.04.2024.
//

import SwiftUI

struct CardView: View {
    var body: some View {
        ZStack(alignment: .bottom) {
            Image(.jane1)
                .resizable()
                .scaledToFill()
            
            UserInfoView()
                .padding(.horizontal)
        }
        .frame(width: cardWidth, height: cardHeight)
        .clipShape(RoundedRectangle(cornerRadius: 25))
    }
}

private extension CardView {
    var cardWidth: CGFloat {
        UIScreen.main.bounds.width - 20
    }
    var cardHeight: CGFloat {
        UIScreen.main.bounds.height / 1.45
    }
}

#Preview {
    CardView()
}
