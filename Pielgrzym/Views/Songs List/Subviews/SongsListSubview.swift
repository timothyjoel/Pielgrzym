//
//  SongsListSubview.swift
//  Pielgrzym
//
//  Created by Tymoteusz Stokarski on 13/10/2021.
//

import SwiftUI

struct SongsList: View {
    
    @Binding var searchEntry: String
    @Binding var songs: [Song]
    
    var body: some View {
        List {
            ForEach(self.songs.enumerated().filter({ (offset, song) -> Bool in
                searchEntry.isEmpty ? true : song.title.lowercased()
                    .contains(searchEntry.lowercased())
            }), id: \.element) { num, song in
                let vm = SongViewModel(song: song, id: num+1)
                NavigationLink(destination: SongView(vm: vm)) {
                    HStack {
                        Text("\(num+1).")
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
