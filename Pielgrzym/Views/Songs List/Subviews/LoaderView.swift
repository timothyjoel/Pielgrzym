//
//  LoaderView.swift
//  Pielgrzym
//
//  Created by Tymoteusz Stokarski on 13/10/2021.
//

import SwiftUI

struct LoaderView: View {
    
    var loaderText: String
    
    var body: some View {
        VStack (spacing: 40) {
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle())
            Text(loaderText)
                .font(.system(size: 16, weight: .semibold, design: .default))
                .foregroundColor(.label)
        }
    }
}
