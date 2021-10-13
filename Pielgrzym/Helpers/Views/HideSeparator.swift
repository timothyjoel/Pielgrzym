//
//  HideSeparator.swift
//  Pielgrzym
//
//  Created by Tymoteusz Stokarski on 13/10/2021.
//

import SwiftUI

struct HideRowSeparatorModifier: ViewModifier {
    static let defaultListRowHeight: CGFloat = 44
    var background: Color
    init(background: Color) {
        var alpha: CGFloat = 0
        UIColor(background).getWhite(nil, alpha: &alpha)
        assert(alpha == 1, "Setting background to a non-opaque color will result in separators remaining visible.")
        self.background = background
    }
    func body(content: Content) -> some View {
        content
            .frame(
                minWidth: 0, maxWidth: .infinity,
                minHeight: Self.defaultListRowHeight,
                alignment: .leading
            )
            .listRowInsets(EdgeInsets())
            .background(background)
    }
}
extension EdgeInsets {
    static let defaultListRowInsets = Self(top: 0, leading: 16, bottom: 0, trailing: 16)
}
extension View {
    func hideRowSeparator(
        insets: EdgeInsets = .defaultListRowInsets,
        background: Color = .white
    ) -> some View {
        modifier(HideRowSeparatorModifier(
            background: background
        ))
    }
}
struct HideRowSeparator_Previews: PreviewProvider {
    static var previews: some View {
        List {
            ForEach(0..<10) { _ in
                Text("Text")
                    .hideRowSeparator()
            }
        }
        .previewLayout(.sizeThatFits)
    }
}
