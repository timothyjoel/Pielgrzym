//
//  SongViewModel.swift
//  Pielgrzym
//
//  Created by Tymoteusz Stokarski on 10/10/2021.
//

import Foundation

public final class SongViewModel {
    
    public var title: String
    public var author: String
    public var sections: [SongSection]
    
    
    public init(song: Song, id: Int) {
        self.title = "\(song.title)"
        self.author = song.author == "" ? "Nieznany" : "\(song.author)"
        self.sections = song.sections
    }
    
    
}
