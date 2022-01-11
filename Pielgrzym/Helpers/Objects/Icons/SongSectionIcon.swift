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
    @Binding var fontSize: CGFloat
    
    var body: some View {
        
        Image(systemName: image.name)
            .resizable()
            .font(.system(size: fontSize - 2, weight: .semibold))
            .frame(width: fontSize + 2, height: fontSize + 2)
            .foregroundColor(color)
    }
    
}
