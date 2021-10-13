//
//  SongSectionsView.swift
//  Pielgrzym
//
//  Created by Tymoteusz Stokarski on 13/10/2021.
//

import SwiftUI

struct SectionsView: View {
    
    var sections: [SongSection]
    
    var body: some View {
        ForEach(sections, id: \.self) { section in
            SectionView(section: section)
                .hideRowSeparator()
                .padding(.horizontal, 16)
        }
    }
    
}
