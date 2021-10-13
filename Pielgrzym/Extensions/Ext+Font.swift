//
//  Ext+Font.swift
//  Pielgrzym
//
//  Created by Tymoteusz Stokarski on 13/10/2021.
//

import SwiftUI

extension Font {
    
    public static var header: Font {
        return Font.system(size: 18, weight: .semibold, design: .rounded)
    }
    
    public static var text: Font {
        return Font.system(size: 18, weight: .regular, design: .default)
    }
    
    public static var navigationTitle: Font {
        return Font.system(size: 30, weight: .semibold, design: .rounded)
    }
    
}
