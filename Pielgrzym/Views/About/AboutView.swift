//
//  AboutView.swift
//  Pielgrzym
//
//  Created by Tymoteusz Stokarski on 08/01/2022.
//

import SwiftUI

struct AboutView: View {
    
    @ObservedObject var vm: SongViewModel
    
    var body: some View {
        
        VStack(spacing: 8) {
            NavigationTitleView(title: vm.title)
            List {
                AuthorHeader(author: vm.author)
                SectionsView(sections: vm.sections)
            }
            .listStyle(PlainListStyle())
            .navigationBarTitle("")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button(action: {
                        vm.tapHeart()
                    }, label: {
                        NavigationIcon(image: .heart(vm.isLiked ? .filled : .empty), color: .main)
                    })
                }
                ToolbarItemGroup(placement: .navigationBarLeading) {
                    Button(action: {
                        
                    }, label: {
                        EmptyView()
                    })
                }
            }
        }
    }
}



struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        SongView(vm: SongViewModel(song: Song(title: "Title1", author: "Lukasz Skotnicki", id: 5, sections: [SongSection(title: "V1", text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.")])))
    }
}
