//
//  Song.swift
//  Pielgrzym
//
//  Created by Tymoteusz Stokarski on 06/10/2021.
//

import Foundation

public struct Song: Decodable, Hashable {
    
    public var title: String
    public var author: String
    public var sections: [SongSection]
    
}

