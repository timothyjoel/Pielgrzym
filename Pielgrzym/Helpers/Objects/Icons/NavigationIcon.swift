//
//  NavigationIcon.swift
//  Pielgrzym
//
//  Created by Tymoteusz Stokarski on 13/10/2021.
//

import SwiftUI

struct NavigationIcon: View {
    
    var image: IconImage.Navigation
    
    var body: some View {
        
        Image(systemName: image.name)
            .resizable()
            .font(.system(size: 20, weight: .semibold))
            .frame(width: 32, height: 32)
            .foregroundColor(Color.label)
        
    }
    
}
