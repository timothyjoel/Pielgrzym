//
//  AboutView.swift
//  Pielgrzym
//
//  Created by Tymoteusz Stokarski on 08/01/2022.
//

import SwiftUI

struct AboutView: View {
    
    var vm = AboutViewModel()
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 4) {
            NavigationTitleView(title: vm.section1Title)
            Text(vm.section1Text)
                .padding()
            Text(vm.section2Title)
                .font(.system(size: 30, weight: .semibold, design: .rounded))
                .padding(.horizontal)
            WedrowiecAppSectionView(vm: vm)
            Spacer()
            .listStyle(PlainListStyle())
            .navigationBarTitle("")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}



struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView()
    }
}

struct WedrowiecAppSectionView: View {
    
    var vm: AboutViewModel
    
    var body: some View {
        HStack(spacing: 20) {
            Image("wedrowiec")
                .resizable()
                .scaledToFit()
                .frame(width: 70, height: 70, alignment: .center)
                .cornerRadius(15)
                .padding()
            VStack(alignment: .leading) {
                Text("Śpiewnik Wędrowca")
                    .font(.system(size: 20, weight: .semibold, design: .rounded))
                    .foregroundColor(.label)
                Text("Zobacz w AppStore")
                    .foregroundColor(.main)
                    .font(.system(size: 20, weight: .semibold, design: .rounded))
                    .onTapGesture {
                        vm.openWedrowiecAppInAppstore()
                    }
            }
            Spacer()
        }
    }
}
