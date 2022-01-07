//
//  IconImage.swift
//  Pielgrzym
//
//  Created by Tymoteusz Stokarski on 11/10/2021.
//

import SwiftUI

public protocol IconRepresentable {
    var name: String { get }
}

public enum IconImage {

    case navigation(Navigation)
    case song(Song)
    
}

extension IconImage {
    
    public enum Navigation: IconRepresentable {
                
        case heart(Heart)
        case share
        case reload
        case menu
        case info
        case contact
        
        public enum Heart {
            case empty
            case filled
        }
        
        public var name: String {
            switch self {
            case .heart(let heart):
                switch heart {
                case .empty:
                    return "heart"
                case .filled:
                    return "heart.fill"
                }
            case .reload:
                return "arrow.clockwise"
            case .share:
                return "square.and.arrow.up"
            case .menu:
                return "list.dash"
            case .info:
                return "info"
            case .contact:
                return "message"
            }
        }
    }
    
}

extension IconImage {
    
    public enum Song: IconRepresentable {
        
        case chorus
        case verse
        case author
        
        public var name: String {
            switch self {
            case .chorus:
                return "c.circle.fill"
            case .verse:
                return "v.circle.fill"
            case .author:
                return "a.circle.fill"
            }
        }
    }
    
}
