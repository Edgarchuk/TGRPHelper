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
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(abilityStore)
        }.commands {
            CommandGroup(before: CommandGroupPlacement.newItem) {
                Button("Save") {
                    let panel = NSSavePanel()
                    if panel.runModal() == .OK {
                        if let url = panel.url {
                            abilityStore.saveAbilities(path: url.path)
                        }
                    }
                    
                }
            }
            CommandGroup(before: CommandGroupPlacement.newItem) {
                Button("Load") {
                    let panel = NSOpenPanel()
                    panel.canChooseDirectories = false
                    if panel.runModal() == .OK {
                        if let url = panel.url {
                            abilityStore.loadAbilities(path: url.path)
                        }
                    }
                }
            }
        }
    }
}
