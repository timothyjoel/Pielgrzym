//
//  LikedSongsListViewModel.swift
//  Pielgrzym
//
//  Created by Tymoteusz Stokarski on 07/01/2022.
//

import Foundation
import RxSwift
import RxCocoa

public final class LikedSongsListViewModel: ObservableObject {
    
    public var title = "Polubione pieśni"
    
    private var allSongs: [Song]
    @Published var songs: [Song] = []
    private var db = DatabaseManager.shared
    private let disposeBag = DisposeBag()
    
    public init(allSongs: [Song]) {
        self.allSongs = allSongs
        observeLikedSongs()
    }
    
    private func observeLikedSongs() {
        db.likedSongs.distinctUntilChanged().subscribe(onNext: { [weak self] ids in
            guard let self = self else { return }
            self.songs = self.allSongs
                .filter( { [weak self] song in
                    guard let self = self else { return false }
                    return self.db.likedSongsRelay.value.contains(song.id)
                })
        }).disposed(by: disposeBag)
    }
    
    public func removeLikedSongs() {
        db.removeLikedSongs()
    }
    
}
