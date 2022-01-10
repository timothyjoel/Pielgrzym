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
                NavigationLink(destination: SongView(vm: SongViewModel(song: song))) {
                    HStack {
                        Text("\(song.id).")
                            .font(.text)
                            .foregroundColor(Color.label)
                            .background(Color.background)
                        Text(song.title)
                            .font(.text)
                            .foregroundColor(Color.label)
                            .background(Color.background)
                    }
                    .listRowBackground(Color.green)
                    .background(Color.background)
                }
                .listRowBackground(Color.pink)
                .background(Color.background)
                .padding(.horizontal, 16)
                .hideRowSeparator()
            }
        }
        .listRowBackground(Color.pink)
        .background(Color.background)
        .listStyle(PlainListStyle())
        .navigationBarTitle("")
        .navigationBarTitleDisplayMode(.inline)
    }
}
