//
//  SongSectionView.swift
//  Pielgrzym
//
//  Created by Tymoteusz Stokarski on 13/10/2021.
//

import SwiftUI

struct SectionView: View {
    
    var section: SongSection
    
    var body: some View {
        ZStack {
            HStack {
                Text(section.text)
                    .font(.text)
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
            .padding(.bottom, 16)
            VStack {
                HStack {
                    HStack(spacing: 4) {
                        SongSectionIcon(image: section.icon, color: section.color)
                        Text(section.part)
                            .font(.header)
                            .foregroundColor(Color.label)
                    }
                    .padding(.horizontal, 4)
                    .background(Color.background)
                    Spacer()
                }
                .padding(.leading, 24)
                Spacer()
            }.padding(.top, 4)
        }
    }
}

struct SectionView_Previews: PreviewProvider {
    static var previews: some View {
        SectionView(section: SongSection(title: "V", text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat."))
    }
}
