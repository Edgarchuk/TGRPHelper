//
//  Backpack.swift
//  TRPGHelper
//
//  Created by Эдгар Назыров on 24.12.2021.
//

import Foundation

struct Backpack:  Codable, Hashable {
    struct Item:  Codable, Hashable, Identifiable {
        var id = UUID().uuidString
        var name: String
    }
    
    var items: [Item] = .init()
    
    mutating func addNewItem() {
        items.append(.init(name: "None"))
    }
    
    mutating func remove(item: Item) {
        for (index, value) in items.enumerated() {
            if value.id == item.id {
                items.remove(at: index)
            }
        }
    }
    mutating func set(name: String, for item: Item) {
        for (index, value) in items.enumerated() {
            if value.id == item.id {
                items[index].name = name
            }
        }
    }
}
