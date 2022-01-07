//
//  DatabaseManager.swift
//  Pielgrzym
//
//  Created by Tymoteusz Stokarski on 06/10/2021.
//

import SwiftUI
import Combine

class DatabaseManager {
    
    static let shared = DatabaseManager()

    // MARK: - Initializers

    private init() { }

}

// MARK: - Private getters

extension DatabaseManager {
    
    private var likedSongs: [Int] {
        UserDefaults.standard.array(forKey: likedSongsKey) as? [Int] ?? []
    }
    
    private var likedSongsKey: String {
        "LikedSongs"
    }
    
}

// MARK: - Public methods

extension DatabaseManager {
    
    public func like(song id: Int) {
        var songs = self.likedSongs
        songs.append(id)
        setLiked(songs)
    }

    public func unlike(song id: Int) {
        let songs = self.likedSongs.filter( { $0 != id })
        setLiked(songs)
    }

    public func isLiked(song id: Int) -> Bool {
        let likedSongs = UserDefaults.standard.array(forKey: likedSongsKey) as? [Int] ?? []
        return likedSongs.contains(id)
    }
    
}

// MARK: - Private methods

extension DatabaseManager {
    
    private func setLiked(_ ids: [Int]) {
        UserDefaults.standard.setValue(ids, forKeyPath: likedSongsKey)
    }
    
}
