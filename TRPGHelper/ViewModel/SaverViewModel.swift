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
    let backpackViewModel: BackpackViewModel
    let playerSkillsViewModel: PlayerSkillsViewModel
    
    init(abilityViewModel: AbilityListViewModel,
         playerViewModel: PlayerViewModel,
         backpackViewModel: BackpackViewModel,
         playerSkillsViewModel: PlayerSkillsViewModel) {
        self.abilityViewModel = abilityViewModel
        self.playerViewModel = playerViewModel
        self.backpackViewModel = backpackViewModel
        self.playerSkillsViewModel = playerSkillsViewModel
    }
    func save() {
        let panel = NSSavePanel()
        if panel.runModal() == .OK {
            if let url = panel.url {
                let saver = Saver(abilities: abilityViewModel.abilities,
                                  player: playerViewModel.player,
                                  backpack: backpackViewModel.backpack,
                                  playerSkills: playerSkillsViewModel.playerSkills)
                saver.save(path: url.path)
            }
        }
    }
    
    func load() {
        let panel = NSOpenPanel()
        panel.canChooseDirectories = false
        if panel.runModal() == .OK {
            if let url = panel.url {
                var saver = Saver()
                saver.load(path: url.path)
                
                abilityViewModel.abilities = saver.abilities
                playerViewModel.player = saver.player
                backpackViewModel.backpack = saver.backpack
                playerSkillsViewModel.playerSkills = saver.playerSkills
                print(backpackViewModel.backpack)
            }
        }
    }
}
