//
//  SongAuthorSectionView.swift
//  Pielgrzym
//
//  Created by Tymoteusz Stokarski on 13/10/2021.
//

import SwiftUI

struct AuthorHeader: View {
    
    var author: String
    
    var body: some View {
        ZStack {
            
            HStack {
                Text(author)
                    .font(.system(size: 16, weight: .regular, design: .rounded))
                    .lineLimit(nil)
                    .padding(.horizontal, 16)
                    .padding(.top, 20)
                    .padding(.bottom, 16)
                Spacer()
            }
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.PLabel, lineWidth: 1.5))
            .padding(.top, 16)
            .padding(.bottom, 8)
            VStack {
                HStack {
                    HStack(spacing: 4) {
                        Image(icon: Icon.Song.author)
                            .frame(width: 24, height: 24)
                            .foregroundColor(Color.purple)
                        Text("Autor")
                            .font(.system(size: 16, weight: .semibold, design: .rounded))
                            .foregroundColor(Color.PLabel)
                    }
                    .padding(.horizontal, 4)
                    .background(Color.PBackground)
                    Spacer()
                }
                .padding(.leading, 24)
                Spacer()
            }.padding(.top, 4)
        }
        .hideRowSeparator()
        .padding(.horizontal, 16)
        .background(RoundedCorners(color: .PBackground))
    }
}
