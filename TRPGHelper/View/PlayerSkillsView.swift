//
//  PlayerSkillsView.swift
//  TRPGHelper
//
//  Created by Эдгар Назыров on 24.12.2021.
//

import Foundation
import SwiftUI
import Combine

struct PlayerSkillsView: View {
    @EnvironmentObject var playerSkillsViewModel: PlayerSkillsViewModel
    
    var body: some View {
        VStack {
            HStack {
                Text("MP:")
                TextField("MP", value: Binding(
                    get: {playerSkillsViewModel.playerSkills.mp},
                    set: {playerSkillsViewModel.playerSkills.mp = $0}),
                          formatter: NumberFormatter()).textFieldStyle(.plain)
                Text("/")
                TextField("max MP", value: Binding(
                    get: {playerSkillsViewModel.playerSkills.maxMp},
                    set: {playerSkillsViewModel.playerSkills.maxMp = $0}),
                          formatter: NumberFormatter()).textFieldStyle(.plain)
            }
            HStack {
                Text("SP:")
                TextField("SP", value: Binding(
                    get: {playerSkillsViewModel.playerSkills.sp},
                    set: {playerSkillsViewModel.playerSkills.sp = $0}),
                          formatter: NumberFormatter()).textFieldStyle(.plain)
                Text("/")
                TextField("max SP", value: Binding(
                    get: {playerSkillsViewModel.playerSkills.maxSp},
                    set: {playerSkillsViewModel.playerSkills.maxSp = $0}),
                          formatter: NumberFormatter()).textFieldStyle(.plain)
            }
            ForEach(playerSkillsViewModel.playerSkills.skills) {skill in
                HStack {
                    Button("Use") {
                        playerSkillsViewModel.playerSkills.use(skill: skill)
                    }
                    TextField("Item", text: Binding(
                        get: {skill.name},
                        set: {playerSkillsViewModel.playerSkills.set(
                            name: $0, for: skill)})).textFieldStyle(.plain)
                    Text("MPCast:")
                    TextField("MPCast", value: Binding(
                        get: { skill.castMp},
                        set: { playerSkillsViewModel.playerSkills
                            .set(castMp: $0, for: skill)}),
                              formatter: NumberFormatter()).textFieldStyle(.plain)
                    Text("SPCast:")
                    TextField("SPCast", value: Binding(
                        get: { skill.castSp},
                        set: { playerSkillsViewModel.playerSkills
                            .set(castSp: $0, for: skill)}),
                              formatter: NumberFormatter()).textFieldStyle(.plain)
                    Image(systemName: "delete.left").onTapGesture {
                        playerSkillsViewModel.playerSkills.remove(skill: skill)
                    }
                }
            }
            Spacer()
            HStack {
                Image(systemName: "plus")
                    .onTapGesture {
                        playerSkillsViewModel.playerSkills.addNewSkills()
                    }
                Spacer()
            }.padding()
        }.padding()
    }
}

struct PlayerSkillsView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerSkillsView().environmentObject({ () -> PlayerSkillsViewModel in
            let playerSkillsViewModel = PlayerSkillsViewModel()
            playerSkillsViewModel.playerSkills.addNewSkills()
            return playerSkillsViewModel
        }())
    }
}
