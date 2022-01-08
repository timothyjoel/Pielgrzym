//
//  SingleActionPopup.swift
//  Pielgrzym
//
//  Created by Tymoteusz Stokarski on 08/01/2022.
//

import SwiftUI

struct SingleActionPopup: View {

    @Binding var showView: Bool
    var popup: SingleActionPopupType
    var action: (() -> Void)?
    
    var body: some View {
        VStack {
            Spacer()
            VStack (spacing: 20) {
                Image(systemName: popup.icon.name)
                    .font(.system(size: 20, weight: .semibold))
                    .imageScale(.large)
                    .frame(width: 32, height: 32)
                    .foregroundColor(.background)
                    .frame(width: 70, height: 70, alignment: .center)
                    .background(RoundedCorners(color: .main, tl: 35, tr: 35, bl: 35, br: 35))
                    .shadow(color: .main.opacity(0.7), radius: 6, x: 0, y: -4)
                    .offset(x: 0, y: -30)
                    .animation(nil)
                Text(popup.message)
                    .font(.system(size: 16, weight: .regular, design: .default))
                    .padding(.top, -30)
                    .animation(nil)
                VStack {
                    Button(action: {
                        self.action?()
                    }) {
                        Text(popup.confirmButtonTitle)
                            .font(.system(size: 16, weight: .semibold, design: .default))
                            .animation(nil)
                    }
                    .frame(width: UIScreen.width*2/3 - 32, height: 50, alignment: .center)
                    .foregroundColor(.background)
                    .background(RoundedCorners(color: .main, tl: 16, tr: 16, bl: 16, br: 16))
                    Button(action: {
                        self.showView.toggle()
                    }) {
                        Text(popup.rejectButtonTitle)
                            .font(.system(size: 16, weight: .semibold, design: .default))
                            .animation(nil)
                    }
                    .foregroundColor(.main)
                    .frame(width: UIScreen.width*2/3 - 32, height: 50, alignment: .center)
                }
            }
            .frame(width: UIScreen.width*2/3, alignment: .center)
            .background(RoundedCorners(color: .background, tl: 16, tr: 16, bl: 16, br: 16))
            .shadow(radius: 20)
            Spacer()
        }
    }
}


struct SingleSelectionPopup_Previews: PreviewProvider {
    static var previews: some View {
        SingleActionPopup(showView: .constant(true), popup: .removeAllLikedSongs, action: nil)
    }
}
