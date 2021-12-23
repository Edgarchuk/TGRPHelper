//
//  SaverViewModel.swift
//  TRPGHelper
//
//  Created by Эдгар Назыров on 24.12.2021.
//

import Foundation
import SwiftUI
import Combine

class SaverViewModel: ObservableObject {
    let abilityViewModel: AbilityListViewModel
    let playerViewModel: PlayerViewModel
    
    init(abilityViewModel: AbilityListViewModel, playerViewModel: PlayerViewModel) {
        self.abilityViewModel = abilityViewModel
        self.playerViewModel = playerViewModel
    }
    func save() {
        let panel = NSSavePanel()
        if panel.runModal() == .OK {
            if let url = panel.url {
                let saver = Saver(abilities: abilityViewModel.abilities,
                                  player: playerViewModel.player)
                saver.save(path: url.path)
            }
        }
    }
    
    func load() {
        let panel = NSOpenPanel()
        panel.canChooseDirectories = false
        if panel.runModal() == .OK {
            if let url = panel.url {
                var saver = Saver(abilities: abilityViewModel.abilities,
                                  player: playerViewModel.player)
                saver.load(path: url.path)
                
                abilityViewModel.abilities = saver.abilities
                playerViewModel.player = saver.player
            }
        }
    }
}
