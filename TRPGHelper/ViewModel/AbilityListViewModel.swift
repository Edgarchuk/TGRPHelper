import Combine
import SwiftUI

class AbilityListViewModel: ObservableObject {
    @Published var abilities = [
        Ability( name: "Ability #0", bonus: 0),
        Ability( name: "Ability #1", bonus: 1),
        Ability( name: "Ability #2", bonus: 2)
    ]
    @Published var selectedAbility: Ability? {
        didSet {
            if let selectedAbility = selectedAbility {
                for index in abilities.indices {
                    if abilities[index].id == selectedAbility.id {
                        abilities[index].name = selectedAbility.name
                        abilities[index].bonus = selectedAbility.bonus
                        abilities[index].effects = selectedAbility.effects
                    }
                }
            }
        }
    }
    
    @Published var selectedAEffect: Ability.Effect?
    
    private let fileManager = FileManager()
    
    public func saveAbilities(path: String) {
        let data = try? JSONEncoder().encode(abilities)
        if fileManager.createFile(atPath: path, contents: data) {
            print("File created at \(path)")
        } else {
            print("could't create file text.txt")
        }
    }
    
    public func loadAbilities(path: String) {
        do {
            let data = try Data(contentsOf: URL(fileURLWithPath: path))
            let decodedData = (try JSONDecoder().decode([Ability].self, from: data))
            abilities = decodedData
            
        } catch let error {
            print("Error in load. error: \(error)")
        }
    }
    
    public func createNewAbility() {
        abilities.append(.init(name: "New Ability", bonus: 0))
    }
    
    public func deleteSelectAbility() {
        if let selectedAbility = selectedAbility {
            abilities = abilities.filter({$0 != selectedAbility})
        }
    }
}
