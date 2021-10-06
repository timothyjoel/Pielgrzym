//
//  DatabaseManager.swift
//  Pielgrzym
//
//  Created by Tymoteusz Stokarski on 06/10/2021.
//

import SwiftUI
import Combine

//class DatabaseManager: ObservableObject {
//
//    @Published var songs: [Song] = []
//    @Published var likedSongs: [Song] = []
//    @Published var state: State = .loading
//
//    private var cancellable: AnyCancellable?
//
//    // MARK: - Methods
//
//    init() {
//        loadSongs()
//    }
//
//
//
//    private func loadLikedSongs() {
//
//    }
//
//    private func like(_ song: Song) {
//        likedSongs.append(song)
//    }
//
//    private func unlike(_ song: Song) {
//        guard let index = likedSongs.firstIndex(where: { $0.title == song.title }) else { return }
//        likedSongs.remove(at: index)
//    }
//
//    func fetchSongs() {
//
//    }
//
//
//}
//
//extension DatabaseManager {
//
//
//
//}
