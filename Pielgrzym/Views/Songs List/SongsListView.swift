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
                        Menu {
                            MenuItem(type: .likedSongs, action: {
                                print("open liked songs")
                            })
                            MenuItem(type: .about, action: {
                                print("open about")
                            })
                            MenuItem(type: .contact, action: {
                                print("open about")
                            })
                        }
                        label: {
                            NavigationIcon(image: .menu)
                        }
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

public enum SongListMenuType {
    
    case likedSongs
    case about
    case contact
    
    public var title: String {
        switch self {
        case .about:
            return "O aplikacji"
        case .contact:
            return "Kontakt"
        case .likedSongs:
            return "Polubione pieśni"
        }
    }
    
    public var icon: IconImage.Navigation {
        switch self {
        case .about:
            return .info
        case .contact:
            return .contact
        case .likedSongs:
            return .heart
        }
    }
    
}

struct MenuListItemView: View {
    
    var type: SongListMenuType
    
    var body: some View {
        HStack {
            Text(type.title)
            NavigationIcon(image: type.icon)
        }
    }
}

struct MenuItem: View {
    
    var type: SongListMenuType
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            MenuListItemView(type: type)
        }
    }
}
