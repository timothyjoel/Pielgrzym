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
                    .font(.system(size: 16, weight: .regular, design: .rounded))
                    .lineLimit(nil)
                    .background(Color.pink)
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
                        Image(icon: section.icon)
                            .frame(width: 24, height: 24)
                            .foregroundColor(section.color)
                        Text(section.part)
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
        .background(RoundedCorners(color: .PBackground))
    }
}

struct SectionView_Previews: PreviewProvider {
    static var previews: some View {
        SectionView(section: SongSection(title: "V", text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat."))
    }
}
