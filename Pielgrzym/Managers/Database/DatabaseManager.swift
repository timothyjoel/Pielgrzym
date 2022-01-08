//
//  DatabaseManager.swift
//  Pielgrzym
//
//  Created by Tymoteusz Stokarski on 06/10/2021.
//

import SwiftUI
import RxSwift
import RxCocoa

class DatabaseManager {
    
    var likedSongsRelay: BehaviorRelay<[Int]>
    
    static let shared = DatabaseManager()

    // MARK: - Initializers

    private init() {
        self.likedSongsRelay = BehaviorRelay(value: UserDefaults.standard.array(forKey: "LikedSongs") as? [Int] ?? [])
    }

}

// MARK: - Public getters

extension DatabaseManager {
    
    public var likedSongs: Observable<[Int]> {
        likedSongsRelay.asObservable()
    }
    
}

// MARK: - Public methods

extension DatabaseManager {
    
    public func like(song id: Int) {
        var songs = self.likedSongsRelay.value
        songs.append(id)
        setLiked(songs)
    }

    public func unlike(song id: Int) {
        let songs = self.likedSongsRelay.value.filter( { $0 != id })
        setLiked(songs)
    }

    public func isLiked(song id: Int) -> Bool {
        return likedSongsRelay.value.contains(id)
    }
    
    public func removeLikedSongs() {
        setLiked([])
    }
    
}

// MARK: - Private methods

extension DatabaseManager {
    
    private func setLiked(_ songs: [Int]) {
        let songs = songs.sorted(by: { $1 > $0 })
        likedSongsRelay.accept(songs)
        UserDefaults.standard.setValue(songs, forKeyPath: "LikedSongs")
    }
    
}
