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
    @State var showConfirmDeleteAllPopup: Bool = false
    
    var body: some View {
        ZStack {
            VStack(spacing: 8) {
                NavigationTitleView(title: vm.title)
                    .padding(.horizontal, 8)
                LikedSongsList(songs: $vm.songs)
            }
            .blur(radius: self.showConfirmDeleteAllPopup ? 10 : 0)
            .background(Color.background)
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button(action: {
                        showConfirmDeleteAllPopup.toggle()
                    }, label: {
                        NavigationIcon(image: .trash)
                    })
                }
                
            }
            .navigationBarHidden(showConfirmDeleteAllPopup)
            SingleActionPopup(showView: $showConfirmDeleteAllPopup, popup: .removeAllLikedSongs) {
                self.vm.removeLikedSongs()
                self.showConfirmDeleteAllPopup.toggle()
            }
            .scaleEffect(self.showConfirmDeleteAllPopup ? 1.0 : 0.5)
            .opacity(self.showConfirmDeleteAllPopup ? 1.0 : 0.0)
            .animation(.spring())
        }
    }
}

struct LikedSongsListView_Previews: PreviewProvider {
    static var previews: some View {
        SongsListView()
    }
}
