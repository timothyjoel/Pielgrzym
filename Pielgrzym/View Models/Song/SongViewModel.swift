//
//  SongViewModel.swift
//  Pielgrzym
//
//  Created by Tymoteusz Stokarski on 10/10/2021.
//

import Foundation
import SwiftUI
import RxSwift

public final class SongViewModel: ObservableObject {
    
    private var id: Int
    public var title: String
    public var author: String
    public var sections: [SongSection]
    
    private var db = DatabaseManager.shared
    
    @Published public var isLiked: Bool = false
    private let disposeBag = DisposeBag()
    
    public init(song: Song) {
        self.id = song.id
        self.title = "\(song.title)"
        self.author = song.author == "" ? "Nieznany" : "\(song.author)"
        self.sections = song.sections
        observeLikeState()
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
    
    private func observeLikeState() {
        db.likedSongs.subscribe(onNext: { [weak self] songs in
            guard let self = self else { return }
            self.isLiked = songs.contains(self.id)
        }).disposed(by: disposeBag)
    }
    
}
