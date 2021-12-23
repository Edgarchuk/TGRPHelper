//
//  TRPGHelperApp.swift
//  TRPGHelper
//
//  Created by Эдгар Назыров on 19.12.2021.
//

import SwiftUI

@main
struct TRPGHelperApp: App {
    let abilityStore = AbilityListViewModel()
    let playerViewModel = PlayerViewModel()
    let saverViewModel: SaverViewModel
    
    init() {
        saverViewModel = .init(abilityViewModel: abilityStore,
                               playerViewModel: playerViewModel)
    }
    
    var body: some Scene {
        WindowGroup {
            Sidebar()
                .environmentObject(abilityStore)
                .environmentObject(playerViewModel)
        }.commands {
            SidebarCommands()
            CommandGroup(before: CommandGroupPlacement.newItem) {
                Button("Save") {
                    saverViewModel.save()
                }
            }
            CommandGroup(before: CommandGroupPlacement.newItem) {
                Button("Load") {
                    saverViewModel.load()
                }
            }
        }
    }
}
