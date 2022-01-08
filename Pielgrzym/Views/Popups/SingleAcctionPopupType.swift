//
//  SingleAcctionPopupType.swift
//  Pielgrzym
//
//  Created by Tymoteusz Stokarski on 08/01/2022.
//

import Foundation

public enum SingleActionPopupType {
    
    case removeAllLikedSongs
    
    var message: String {
        switch self {
        case .removeAllLikedSongs:
            return "Czy na pewno chcesz usunąć wszystkie polubione pieśni?"
        }
    }
    
    var confirmButtonTitle: String {
        switch self {
        default: return "Akceptuj"
        }
    }
    
    var rejectButtonTitle: String {
        switch self {
        default: return "Anuluj"
        }
    }
    
    var icon: IconImage.Navigation {
        switch self {
        case .removeAllLikedSongs:
            return .trash
        }
    }
    
    
}
