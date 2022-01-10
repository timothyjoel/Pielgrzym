//
//  AboutViewModel.swift
//  Pielgrzym
//
//  Created by Tymoteusz Stokarski on 08/01/2022.
//

import SwiftUI

public final class AboutViewModel {
    
    public var section1Title = "O aplikacji"
    public var section1Text = "Śpiewnik zawiera pieśni dotyczące Boga oraz życia chrześcijanina od nawrócenia do zakończenia jego ziemskiego życia. Znajdują się w nim także utwory śpiewane podczas adwentu, świąt Bożego Narodzenia oraz Wielkanocnych, uroczystości chrztu, pamiątki Wieczerzy Pańskiej. Ponadto umieszczone są w nim pieśni dla młodzieży, śpiewane podczas ślubów, pogrzebów oraz nabożeństw kończących rok kalendarzowy. Używany jest w zborach o charakterze ewangelikalnym (m.in. Kościele Zielonoświątkowym, Kościele Ewangelicznych Chrześcijan, Kościele Wolnych Chrześcijan czy Kościele Baptystycznym)."
    public var section2Title = "Podobne aplikacje"
    
    public func openWedrowiecAppInAppstore() {
        if let url = URL(string: "https://apps.apple.com/pl/app/w%C4%99drowiec/id1512655804") {
            UIApplication.shared.open(url)
        }
    }
    
}
