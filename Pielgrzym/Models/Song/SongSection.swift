//
//  SongSection.swift
//  Pielgrzym
//
//  Created by Tymoteusz Stokarski on 06/10/2021.
//

import Foundation
import SwiftUI

public struct SongSection: Decodable, Hashable {
    
    private var title: String
    public var text: String
    
    init(title: String, text: String) {
        self.title = title
        self.text = text
    }
    
    public var type: SongSectionType {
        SongSectionType(rawValue: title)!
    }
    
    public var part: String {
        type.title
    }
    
    public var icon: IconRepresentable {
        type.icon
    }
    public var color: Color {
        type.iconColor
    }
    
}

