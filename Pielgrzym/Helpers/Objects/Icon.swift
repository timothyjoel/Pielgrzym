//
//  Icon.swift
//  Pielgrzym
//
//  Created by Tymoteusz Stokarski on 11/10/2021.
//

import SwiftUI

public protocol IconRepresentable {
    var name: String { get }
}

public enum Icon {
    
    case navigation(Navigation)
    case song(Song)
    
}

extension Icon {
    
    public enum Navigation: IconRepresentable {
        case heart
        case share
        case reload
        
        public var name: String {
            switch self {
            case .heart:
                return "TODO"
            case .reload:
                return "TODO"
            case .share:
                return "TODO"
            }
        }
    }
    
}

extension Icon {
    
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
