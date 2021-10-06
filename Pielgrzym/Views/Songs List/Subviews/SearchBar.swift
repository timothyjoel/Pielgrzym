//
//  SearchBar.swift
//  Pielgrzym
//
//  Created by Tymoteusz Stokarski on 06/10/2021.
//

import SwiftUI

struct SearchBar: UIViewRepresentable {

    var placeholder: String
    @Binding var text: String

    class Coordinator: NSObject, UISearchBarDelegate {

        @Binding var text: String

        init(text: Binding<String>) {
            self._text = text
        }
        
        func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
            searchBar.resignFirstResponder()
        }

        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            text = searchText
            searchBar.showsCancelButton = true
        }
        
        func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
            searchBar.resignFirstResponder()
        }
        
        func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
            searchBar.resignFirstResponder()
            searchBar.showsCancelButton = false
            text = ""
        }
        
    }

    func makeCoordinator() -> SearchBar.Coordinator {
        return Coordinator(text: $text)
    }

    func makeUIView(context: UIViewRepresentableContext<SearchBar>) -> UISearchBar {
        let searchBar = UISearchBar(frame: .zero)
        searchBar.delegate = context.coordinator
        searchBar.searchBarStyle = .minimal
        searchBar.returnKeyType = .done
        searchBar.placeholder = placeholder
        searchBar.enablesReturnKeyAutomatically = false
        searchBar.tintColor = .systemBlue
        return searchBar
    }

    func updateUIView(_ uiView: UISearchBar, context: UIViewRepresentableContext<SearchBar>) {
        uiView.text = text
    }
    
}
