//
//  SongsListView.swift
//  Pielgrzym
//
//  Created by Tymoteusz Stokarski on 29/09/2021.
//

import SwiftUI

struct SongsListView: View {
    
    @ObservedObject var vm = SongsListViewModel()
    @State var searchEntry: String = ""
    
    var body: some View {
        NavigationView {
            VStack {
                if self.vm.state == .loading {
                    VStack (spacing: 40) {
                        ProgressView()
                            .progressViewStyle(CircularProgressViewStyle())
                        Text("Ładowanie pieśni...")
                            .font(.system(size: 16, weight: .semibold, design: .default))
                            .foregroundColor(.PLabel)
                    }
                    .foregroundColor(.blue)
                }
                
                if self.vm.state == .success {
                    SearchBar(placeholder: vm.searchPlaceholder, text: $searchEntry)
                    .padding(.horizontal, 12)
                    List {
                        ForEach(self.vm.songs.enumerated().filter({ (offset, song) -> Bool in
                            searchEntry.isEmpty ? true : song.title.lowercased()
                                .contains(searchEntry.lowercased())
                        }), id: \.element) { num, song in
                            let vm = SongViewModel(song: song, id: num+1)
                            NavigationLink(destination: SongView(vm: vm)) {
                                HStack {
                                    Text("\(num+1).")
                                    Text(song.title)
                                }
                            }
                        }
                    }
                    .listStyle(PlainListStyle())
                    .navigationBarTitle(Text(vm.title))
                }
                
            }
            .background(Color.PBackground)
        }
    }
}

struct SongsListView_Previews: PreviewProvider {
    static var previews: some View {
        SongsListView()
    }
}
