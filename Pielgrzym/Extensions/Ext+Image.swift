//
//  Ext+Image.swift
//  Pielgrzym
//
//  Created by Tymoteusz Stokarski on 11/10/2021.
//

import SwiftUI

public extension Image {
    
    init(icon: IconRepresentable) {
        self.init(systemName: icon.name)
    }
    
}
