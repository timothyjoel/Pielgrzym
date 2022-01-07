//
//  SongViewModel.swift
//  Pielgrzym
//
//  Created by Tymoteusz Stokarski on 10/10/2021.
//

import Foundation
import SwiftUI

public final class SongViewModel: ObservableObject {
    
    private var id: Int
    public var title: String
    public var author: String
    public var sections: [SongSection]
    
    private var db = DatabaseManager.shared
    
    @Published public var isLiked: Bool
    
    
    public init(song: Song, id: Int) {
        self.id = id
        self.title = "\(song.title)"
        self.author = song.author == "" ? "Nieznany" : "\(song.author)"
        self.sections = song.sections
        self.isLiked = db.isLiked(song: id)
    }
    
    public func tapHeart() {
        isLiked ? unLike() : like()
    }
    
    private func like() {
        isLiked.toggle()
        db.like(song: id)
    }
    
    private func unLike() {
        isLiked.toggle()
        db.unlike(song: id)
    }
    
}
