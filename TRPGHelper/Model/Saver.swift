//
//  Saver.swift
//  TRPGHelper
//
//  Created by Эдгар Назыров on 24.12.2021.
//

import Foundation

struct Saver: Codable {
    var abilities: [Ability] = .init()
    var player: Player = .init(name: "", bio: "")
    var backpack: Backpack = .init()
    var playerSkills: PlayerSkills = .init()
    
    public func save(path: String) {
        let fileManager = FileManager()
        let data = try? JSONEncoder().encode(self)
        if fileManager.createFile(atPath: path, contents: data) {
            print("File created at \(path)")
        } else {
            print("could't create file text.txt")
        }
    }
    
    public mutating func load(path: String) {
        do {
            let data = try Data(contentsOf: URL(fileURLWithPath: path))
            let decodedData = (try JSONDecoder().decode(Saver.self, from: data))
            abilities = decodedData.abilities
            player = decodedData.player
            backpack = decodedData.backpack
            playerSkills = decodedData.playerSkills
            
        } catch let error {
            print("Error in load. error: \(error)")
        }
    }
}
