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
            VStack(spacing: 8) {
                if self.vm.state == .loading {
                    LoaderView(loaderText: vm.loaderText)
                }
                if self.vm.state == .success {
                    NavigationTitleView(title: vm.title)
                    SearchBar(placeholder: vm.searchPlaceholder, text: $searchEntry)
                    .padding(.horizontal, 8)
                    SongsList(searchEntry: $searchEntry, songs: $vm.songs)
                }
            }
            .background(Color.background)
            .toolbar {
                
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button(action: {
                        vm.loadSongs()
                    }, label: {
                        NavigationIcon(image: .reload)
                    })
                }
                
                ToolbarItemGroup(placement: .navigationBarLeading) {
                    Button(action: {
                        print("menu tapped")
                    }, label: {
                        NavigationIcon(image: .reload)
                    })
                }
                
            }
        }
    }
}

struct SongsListView_Previews: PreviewProvider {
    static var previews: some View {
        SongsListView()
    }
}
