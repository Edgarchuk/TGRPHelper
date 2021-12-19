//
//  TRPGHelperApp.swift
//  TRPGHelper
//
//  Created by Эдгар Назыров on 19.12.2021.
//

import SwiftUI

@main
struct TRPGHelperApp: App {
    let abilityStore = AbilityStore()
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(abilityStore)
        }.commands {
            CommandGroup(before: CommandGroupPlacement.newItem) {
                Button("Save") {
                    let panel = NSSavePanel()
                    if panel.runModal() == .OK {
                        if let url = panel.url {
                            abilityStore.saveAbilities(url: url)
                        }
                        print(panel.url)
                    }
                    
                }
            }
            CommandGroup(before: CommandGroupPlacement.newItem) {
                Button("Load") {
                    print("before item")
                }
            }
        }
    }
}
