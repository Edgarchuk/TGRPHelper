import Foundation

struct Ability: Codable, Hashable, Identifiable {
    
    struct Effect: Codable, Hashable, Identifiable {
        var id = UUID().uuidString
        var name: String
        var bonus: Int
        var isActive: Bool
    }
    
    var id = UUID().uuidString
    var name: String
    var bonus: Int
    
    var effects: [Effect] = .init()
    
    mutating func setBouns(to effect: Effect, value: Int) {
        for index in effects.indices {
            if effects[index].id == effect.id {
                effects[index].bonus = value
            }
        }
    }
    
    mutating func setIsActive(to effect: Effect, value: Bool) {
        for index in effects.indices {
            if effects[index].id == effect.id {
                effects[index].isActive = value
            }
        }
    }
    
    mutating func setName(to effect: Effect, value: String) {
        for index in effects.indices {
            if effects[index].id == effect.id {
                effects[index].name = value
            }
        }
    }
    
    mutating func addNewEffect() {
        effects.append(.init(name: "None", bonus: 0, isActive: false))
    }
    
    func getBonus() -> Int {
        var result: Int = bonus
        effects.forEach {
            result += $0.isActive ? $0.bonus : 0
        }
        return result
    }
    
}
