//
//  SongSectionIcon.swift
//  Pielgrzym
//
//  Created by Tymoteusz Stokarski on 13/10/2021.
//

import SwiftUI

struct SongSectionIcon: View {
    
    var image: IconImage.Song
    var color: Color
    
    var body: some View {
        
        Image(systemName: image.name)
            .resizable()
            .font(.system(size: 16, weight: .semibold))
            .frame(width: 20, height: 20)
            .foregroundColor(color)
    }
    
}
