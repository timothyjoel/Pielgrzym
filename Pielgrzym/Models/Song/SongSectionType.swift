//
//  SongSectionTitleType.swift
//  Pielgrzym
//
//  Created by Tymoteusz Stokarski on 06/10/2021.
//

import Foundation
import SwiftUI

public enum SongSectionType: String, Decodable {
    
    case V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, C
    
    var title: String {
        
        switch self {
        
        case .V1:
            return "Zwrotka 1"
        case .V2:
            return "Zwrotka 2"
        case .V3:
            return "Zwrotka 3"
        case .V4:
            return "Zwrotka 4"
        case .V5:
            return "Zwrotka 5"
        case .V6:
            return "Zwrotka 6"
        case .V7:
            return "Zwrotka 7"
        case .V8:
            return "Zwrotka 8"
        case .V9:
            return "Zwrotka 9"
        case .V10:
            return "Zwrotka 10"
        case .C:
            return "Refren"
        }
        
    }
    
    var icon: IconRepresentable {
        switch self {
        case .C:
            return Icon.Song.chorus
        default:
            return Icon.Song.verse
        }
    }
    
    var iconColor: Color {
        switch self {
        case .C:
            return .orange
        default:
            return .green
        }
    }
    
}
