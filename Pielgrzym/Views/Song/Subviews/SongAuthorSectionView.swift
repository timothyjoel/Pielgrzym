//
//  SongAuthorSectionView.swift
//  Pielgrzym
//
//  Created by Tymoteusz Stokarski on 13/10/2021.
//

import SwiftUI

struct AuthorHeader: View {
    
    var author: String
    @Binding var fontSize: CGFloat
    
    var body: some View {
        ZStack {
            
            HStack {
                Text(author)
                    .font(.system(size: fontSize, weight: .regular, design: .default))
                    .lineLimit(nil)
                    .padding(.horizontal, 16)
                    .padding(.top, 20)
                    .padding(.bottom, 16)
                Spacer()
            }
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.label, lineWidth: 1.5))
            .padding(.top, 16)
            .padding(.bottom, 8)
            VStack {
                HStack {
                    HStack(spacing: 4) {
                        SongSectionIcon(image: .author, color: .purple, fontSize: $fontSize)
                        Text("Autor")
                            .font(.system(size: fontSize, weight: .semibold, design: .rounded))
                            .foregroundColor(.label)
                    }
                    .padding(.horizontal, 4)
                    .background(Color.background)
                    Spacer()
                }
                .padding(.leading, 24)
                Spacer()
            }.padding(.top, (-fontSize + 26)/2)
        }
        .hideRowSeparator()
        .padding(.horizontal, 16)
    }
}
