//
//  LikedSongsListView.swift
//  Pielgrzym
//
//  Created by Tymoteusz Stokarski on 07/01/2022.
//

import Foundation
import SwiftUI

struct LikedSongsListView: View {
    
    @ObservedObject var vm: LikedSongsListViewModel
    @State var showConfirmPopup: Bool = false
    
    var body: some View {
            VStack(spacing: 8) {
                NavigationTitleView(title: vm.title)
                    .padding(.horizontal, 8)
                LikedSongsList(songs: $vm.songs)
            }
        .background(Color.background)
        .toolbar {
            ToolbarItemGroup(placement: .navigationBarTrailing) {
                Button(action: {
                    print("todo")
                }, label: {
                    NavigationIcon(image: .trash)
                })
            }
        }
    }
}

struct LikedSongsListView_Previews: PreviewProvider {
    static var previews: some View {
        SongsListView()
    }
}
