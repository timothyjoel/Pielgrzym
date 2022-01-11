//
//  AboutView.swift
//  Pielgrzym
//
//  Created by Tymoteusz Stokarski on 08/01/2022.
//

import SwiftUI

struct AboutView: View {
    
    var vm = AboutViewModel()
    
    @State var fontSize: CGFloat = 18
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 4) {
            NavigationSongTitleView(title: vm.section1Title, fontSize: $fontSize)
            Text(vm.section1Text)
                .font(.system(size: fontSize, weight: .regular, design: .default))
                .padding()
            Text(vm.section2Title)
                .font(.system(size: fontSize + 12, weight: .semibold, design: .rounded))
                .padding(.horizontal)
            WedrowiecAppSectionView(vm: vm, fontSize: $fontSize)
            Spacer()
            .listStyle(PlainListStyle())
            .navigationBarTitle("")
            .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItemGroup(placement: .navigationBarTrailing) {
                        Button(action: {
                            fontSize -= 1
                        }, label: {
                            Text("a")
                        })
                        Button(action: {
                            fontSize += 1
                        }, label: {
                            Text("A")
                        })
                    }
//                    ToolbarItemGroup(placement: .navigationBarLeading) {
//                        Button(action: {
//
//                        }, label: {
//                            EmptyView()
//                        })
//                    }
                }
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
    
    @Binding var fontSize: CGFloat
    
    var body: some View {
        HStack(spacing: 20) {
            Image("wedrowiec")
                .resizable()
                .scaledToFit()
                .frame(width: 16 + fontSize * 3, height: 16 + fontSize * 3, alignment: .center)
                .cornerRadius(15)
                .padding()
            VStack(alignment: .leading) {
                Text("Śpiewnik Wędrowca")
                    .font(.system(size: fontSize + 2, weight: .semibold, design: .rounded))
                    .foregroundColor(.label)
                Text("Zobacz w AppStore")
                    .foregroundColor(.main)
                    .font(.system(size: fontSize + 2, weight: .semibold, design: .rounded))
                    .onTapGesture {
                        vm.openWedrowiecAppInAppstore()
                    }
            }
            Spacer()
        }
    }
}
