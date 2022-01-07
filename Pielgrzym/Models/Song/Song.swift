//
//  Song.swift
//  Pielgrzym
//
//  Created by Tymoteusz Stokarski on 06/10/2021.
//

import Foundation

public struct SongRaw: Decodable, Hashable {
    
    public var title: String
    public var author: String
    public var sections: [SongSection]
    
}

public struct Song: Hashable {
    
    public var title: String
    public var author: String
    public var id: Int
    public var sections: [SongSection]
    
}

