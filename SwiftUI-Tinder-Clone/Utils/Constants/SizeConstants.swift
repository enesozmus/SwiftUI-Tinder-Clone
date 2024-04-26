//
//  SizeConstants.swift
//  SwiftUI-Tinder-Clone
//
//  Created by enesozmus on 26.04.2024.
//

import SwiftUI

struct SizeConstants {
    
    static var cardWidth: CGFloat {
        UIScreen.main.bounds.width - 20
    }
    
    static var cardHeight: CGFloat {
        UIScreen.main.bounds.height / 1.45
    }
    
    static var screenCutoff: CGFloat {
        (UIScreen.main.bounds.width / 2) * 0.8
    }
}
