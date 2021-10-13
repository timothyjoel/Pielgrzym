//
//  SongView.swift
//  Pielgrzym
//
//  Created by Tymoteusz Stokarski on 10/10/2021.
//

import SwiftUI

struct SongView: View {
    
    var vm: SongViewModel
    
    var body: some View {
        
        VStack {
            NavigationTitleView(title: vm.title)
            List {
                AuthorHeader(author: vm.author)
                SectionsView(sections: vm.sections)
            }
            .listStyle(PlainListStyle())
            .navigationBarTitle("")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}



struct SongView_Previews: PreviewProvider {
    static var previews: some View {
        SongView(vm: SongViewModel(song: Song(title: "Title1", author: "Lukasz Skotnicki", sections: [SongSection(title: "V1", text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.")]), id: 5))
    }
}

struct NavigationTitleView: View {
    
    var title: String
    
    var body: some View {
        HStack {
            Text(title)
                .font(.system(size: 30, weight: .semibold, design: .rounded))
                .foregroundColor(Color.PLabel)
            Spacer()
        }.padding(.horizontal)
    }
}
