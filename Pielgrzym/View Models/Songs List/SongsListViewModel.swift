//
//  SongsListViewModel.swift
//  Pielgrzym
//
//  Created by Tymoteusz Stokarski on 29/09/2021.
//

import SwiftUI
import Combine

class SongsListViewModel: ObservableObject {
    
    @Published var songs: [Song] = []
    @Published var state: State = .loading
    private var cancellable: AnyCancellable?
    
    var searchPlaceholder = "Wprowadź tytuł pieśni"
    var loaderText = "Ładowanie pieśni..."
    var title = "Śpiewnik Pielgrzyma"
    
    // MARK: - Initializers
    
    init() {
        loadSongs()
    }
    
    public func loadSongs() {
        self.state = .loading
        songs.removeAll()
        guard let url = URL(string: URLPath.pielgrzym) else { self.state = .failed; return }
        self.cancellable = URLSession.shared.dataTaskPublisher(for: url)
            .tryMap { output in
                guard let response = output.response as? HTTPURLResponse, response.statusCode == 200 else { self.state = .failed
                    throw LoadingError.generalError
                }
                return output.data
        }
        .receive(on: RunLoop.main)
        .decode(type: [SongRaw].self, decoder: JSONDecoder())
        .replaceError(with: [])
        .eraseToAnyPublisher()
        .sink(receiveCompletion: { completion in
            switch completion {
            case .finished:
                break
            case .failure(let error):
                fatalError(error.localizedDescription)
            }
        }, receiveValue: { songs in
            self.songs = songs.enumerated().map( { Song(title: $0.element.title, author: $0.element.author, id: $0.offset+1, sections: $0.element.sections)})
            self.state = .success
        })
    }
    
}

extension  SongsListViewModel {
    
    public enum State {
        case loading, success, failed
    }

    public struct URLPath {
        static let pielgrzym: String = "https://raw.githubusercontent.com/timothyjoel/Pielgrzym/main/pielgrzym2.json"
    }

    public enum LoadingError: LocalizedError {
        case generalError
    }
    
}


