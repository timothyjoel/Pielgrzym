//
//  SongSectionsView.swift
//  Pielgrzym
//
//  Created by Tymoteusz Stokarski on 13/10/2021.
//

import SwiftUI

struct SectionsView: View {
    
    var sections: [SongSection]
    @Binding var fontSize: CGFloat
    
    var body: some View {
        ForEach(sections, id: \.self) { section in
            SectionView(section: section, fontSize: $fontSize)
                .hideRowSeparator()
                .padding(.horizontal, 16)
        }
        .padding(.top, 16)
    }
    
}
