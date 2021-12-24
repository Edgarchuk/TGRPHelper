//
//  Skills.swift
//  TRPGHelper
//
//  Created by Эдгар Назыров on 24.12.2021.
//

import Foundation

struct PlayerSkills: Codable, Hashable {
    var mp: Decimal = 0 {
        didSet {
            checkMp()
        }
    }
    var maxMp: Decimal = 0 {
        didSet {
            checkMp()
        }
    }
    
    private mutating func checkMp() {
        if mp > maxMp {
            mp = maxMp
        }
        if mp < 0 {
            mp = 0
        }
    }
    
    var sp: Decimal = 0 {
        didSet {
            checkSp()
        }
    }
    
    var maxSp: Decimal = 0 {
        didSet {
            checkSp()
        }
    }
    
    private mutating func checkSp() {
        if sp > maxSp {
            sp = maxSp
        }
    }
    
    struct Skill: Codable, Hashable, Identifiable {
        var id = UUID().uuidString
        var name: String
        var castMp: Decimal
        var castSp: Decimal
    }
    
    var skills: [Skill] = .init()
    
    mutating func set(name: String, for skill: Skill) {
        for (index, value) in skills.enumerated() {
            if skill.id == value.id {
                skills[index].name = name
            }
        }
    }
    
    mutating func set(castMp: Decimal, for skill: Skill) {
        for (index, value) in skills.enumerated() {
            if skill.id == value.id {
                skills[index].castMp = castMp
            }
        }
    }
    
    mutating func set(castSp: Decimal, for skill: Skill) {
        for (index, value) in skills.enumerated() {
            if skill.id == value.id {
                skills[index].castSp = castSp
            }
        }
    }
    
    mutating func addNewSkills() {
        skills.append(.init(name: "None", castMp: 0, castSp: 0))
    }
    
    mutating func remove(skill: Skill) {
        for (index, value) in skills.enumerated() {
            if skill.id == value.id {
                skills.remove(at: index)
            }
        }
    }
    
    mutating func use(skill: Skill) {
        mp -= skill.castMp
        sp -= skill.castSp
    }
}
