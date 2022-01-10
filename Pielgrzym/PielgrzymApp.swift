//
//  PielgrzymApp.swift
//  Pielgrzym
//
//  Created by Tymoteusz Stokarski on 29/09/2021.
//

import SwiftUI

@main
struct PielgrzymApp: App {
    
    @Environment(\.scenePhase) private var scenePhase
    
    var body: some Scene {
        WindowGroup {
            SongsListView()
        }.onChange(of: scenePhase) { newScene in
            switch newScene {
            case .background:
                print("Did enter background")
            case .inactive:
                print("Did became inactive")
            case .active:
                let newAppearance = UINavigationBarAppearance()
                newAppearance.configureWithOpaqueBackground()
                newAppearance.backgroundColor = .systemBackground
                newAppearance.titleTextAttributes = [.foregroundColor: UIColor.label]
                newAppearance.shadowColor = .clear
                UINavigationBar.appearance().standardAppearance = newAppearance
                UINavigationBar.appearance().tintColor = UIColor.label
                UITableViewCell.appearance().selectionStyle = .none
                UITableViewCell.appearance().backgroundColor = .systemBackground
                UITableView.appearance().backgroundColor = .systemBackground
            @unknown default:
                print("Unknown state")
            }
        }
    }
}
