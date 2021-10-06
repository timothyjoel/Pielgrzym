//
//  SongSection.swift
//  Pielgrzym
//
//  Created by Tymoteusz Stokarski on 06/10/2021.
//

import Foundation

struct SongSection: Decodable, Hashable {
    
    private var title: String
    public var text: String
    
    public var part: SongSectionType {
        SongSectionType(rawValue: title)!
    }
    
}

