//
//  PlayerSkillsViewModel.swift
//  TRPGHelper
//
//  Created by Эдгар Назыров on 24.12.2021.
//

import Foundation
import Combine

class PlayerSkillsViewModel: ObservableObject {
    @Published var playerSkills: PlayerSkills = .init()
}
