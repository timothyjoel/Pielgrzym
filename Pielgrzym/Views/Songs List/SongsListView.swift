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
                        }), id: \.element) { index, song in
                            
                            HStack {
                                Text("\(index+1).")
                                Text(song.title)
                            }
//                            NavigationLink(destination: SongView(song, self.db)) {
//                                HStack {
//                                    Text("\(song.number).")
//                                    Text(song.title)
//                                }
//                            }
                        }
                    }
                    .listStyle(PlainListStyle())
//                    .navigationBarItems(leading: NavigationLink(destination: LikedSongsView(db: db), label: {
//                        Icon(image: .favorite, size: .medium, weight: .semibold, color: .mainColor)
//                    }), trailing: Button(action: {
//                        self.vm.fetchSongs()
//                    }, label: {
//                        Icon(image: .reload, size: .medium, weight: .semibold, color: .mainColor)
//                    }))
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
