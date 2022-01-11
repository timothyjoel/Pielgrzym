//
//  SongView.swift
//  Pielgrzym
//
//  Created by Tymoteusz Stokarski on 10/10/2021.
//

import SwiftUI

struct SongView: View {
    
    @ObservedObject var vm: SongViewModel
    @State var fontSize: CGFloat = 18
    
    var body: some View {
        
        VStack(spacing: 16) {
            NavigationSongTitleView(title: vm.title, fontSize: $fontSize)
            List {
                AuthorHeader(author: vm.author, fontSize: $fontSize)
                SectionsView(sections: vm.sections, fontSize: $fontSize)
            }
            .listStyle(PlainListStyle())
            .navigationBarTitle("")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button(action: {
                        fontSize -= 1
                    }, label: {
                        Text("a")
                    })
                    Button(action: {
                        fontSize += 1
                    }, label: {
                        Text("A")
                    })
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



struct SongView_Previews: PreviewProvider {
    static var previews: some View {
        SongView(vm: SongViewModel(song: Song(title: "Title1", author: "Lukasz Skotnicki", id: 5, sections: [SongSection(title: "V1", text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.")])))
    }
}

struct NavigationTitleView: View {
    
    var title: String
    
    var body: some View {
        HStack {
            Text(title)
                .font(.system(size: 30, weight: .semibold, design: .rounded))
                .foregroundColor(.label)
            Spacer()
        }.padding(.horizontal)
    }
}

struct NavigationSongTitleView: View {
    
    var title: String
    @Binding var fontSize: CGFloat
    
    var body: some View {
        HStack {
            Text(title)
                .font(.system(size: fontSize + 12, weight: .semibold, design: .rounded))
                .foregroundColor(.label)
            Spacer()
        }.padding(.horizontal)
    }
}
