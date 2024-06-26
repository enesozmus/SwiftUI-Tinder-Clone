//
//  CardImageIndicatorView.swift
//  SwiftUI-Tinder-Clone
//
//  Created by enesozmus on 26.04.2024.
//

import SwiftUI

struct CardImageIndicatorView: View {
    
    let currentImageIndex: Int
    let imageCount: Int
    
    var body: some View {
        HStack {
            ForEach(0 ..< imageCount, id: \.self) { index in
                Capsule()
                    .frame(width: imageIndicatorWidth, height: 5)
                    .foregroundStyle(index == currentImageIndex ? .white : .gray)
                    .padding(.top, 10)
            }
        }
        .shadow(color: .black.opacity(1), radius: 20, x: 0, y: 0)
    }
}

#Preview {
    ZStack {
        Color.black
        CardImageIndicatorView(currentImageIndex: 1, imageCount: 9)
    }
}

private extension CardImageIndicatorView {
    var imageIndicatorWidth: CGFloat {
        return SizeConstants.cardWidth / CGFloat(imageCount) - 28
    }
}
