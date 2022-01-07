//
//  LikedSongsList.swift
//  Pielgrzym
//
//  Created by Tymoteusz Stokarski on 07/01/2022.
//

import Foundation
import SwiftUI

struct LikedSongsList: View {
    
    @Binding var songs: [Song]
    
    var body: some View {
        List {
            ForEach(self.songs.enumerated().filter({ (offset, song) -> Bool in
                return true
            }), id: \.element) { num, song in
                let vm = SongViewModel(song: song)
                NavigationLink(destination: SongView(vm: vm)) {
                    HStack {
                        Text("\(song.id).")
                            .font(.text)
                            .foregroundColor(Color.label)
                        Text(song.title)
                            .font(.text)
                            .foregroundColor(Color.label)
                    }
                }
                .padding(.horizontal, 16)
                .hideRowSeparator()
                .listRowBackground(Color.clear)
            }
        }
        .listStyle(PlainListStyle())
        .navigationBarTitle("")
        .navigationBarTitleDisplayMode(.inline)
    }
}
