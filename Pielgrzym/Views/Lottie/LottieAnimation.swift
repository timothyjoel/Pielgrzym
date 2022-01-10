//
//  LottieAnimation.swift
//  Pielgrzym
//
//  Created by Tymoteusz Stokarski on 08/01/2022.
//

import Foundation

enum LottieAnimation {
    
    case hourGlass
    
    var name: String {
        switch self {
        case .hourGlass: return "Hourglass"
        }
    }
    
}
