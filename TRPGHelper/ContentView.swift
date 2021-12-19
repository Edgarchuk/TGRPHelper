//
//  ContentView.swift
//  TRPGHelper
//
//  Created by Эдгар Назыров on 19.12.2021.
//

import SwiftUI
import Combine


struct Ability: Codable, Hashable, Identifiable {
    var id = UUID().uuidString
    var name: String
    var bonus: Int
}


struct ContentView: View {

    @EnvironmentObject var abilityStore: AbilityStore

    var body: some View {
        NavigationView {
            AbilityList()
            if self.abilityStore.selectedAbility != nil {
                AbilityDetail()
            }
        }
    }
}

struct AbilityList: View {

    @EnvironmentObject var abilityStore: AbilityStore

    var body: some View {
        List(selection: self.$abilityStore.selectedAbility) {
            ForEach(Array(abilityStore.abilities.enumerated()),
                    id: \.element) { index, Ability in
                AbilityRow(Ability: Ability)
          }
        }
        .listStyle(SidebarListStyle())
    }
}

struct AbilityRow: View {
    var Ability: Ability

    var body: some View {
        Text("\(Ability.name)")
            .padding(12)
    }
}

struct AbilityDetail: View {
    @EnvironmentObject var abilityStore: AbilityStore

    var body: some View {
        VStack {
            if abilityStore.selectedAbility != nil {
                HStack {
                    Text("Name:")
                    TextField("Name", text: Binding (
                        get: {
                            abilityStore.selectedAbility?.name ?? ""
                        },
                        set: {
                            abilityStore.selectedAbility?.name = $0
                        })
                    )
                }
                .padding()
                HStack {
                    Text("Bonus:")
                    TextField("Bonus", text: Binding (
                        get: {
                            abilityStore.selectedAbility?.bonus.description ?? ""
                        },
                        set: {
                            abilityStore.selectedAbility?.bonus = Int($0) ?? 0
                        })
                    )
                }
                .padding()
            }
            RandomCubeView()
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

class AbilityStore: ObservableObject {
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
                    }
                }
            }
        }
    }
    
    public func saveAbilities(url: URL) {
        try? (abilities as NSArray).write(to: url, atomically: true)
    }
}

struct RandomCubeView: View {
    @EnvironmentObject var abilityStore: AbilityStore
    @State private var randomNumber: Int?
    var body: some View {
        VStack {
            Button("Drop Cube") {
                randomNumber = Int.random(in: 1...20) + abilityStore.selectedAbility!.bonus
            }
            ZStack {
                Image(systemName: "pentagon")
                    .resizable()
                    .foregroundColor(.accentColor)
                if let randomNumber = randomNumber {
                    Text("\(randomNumber)")
                        .font(.largeTitle)
                }
            }
            .frame(width: 100, height: 100)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView().environmentObject(AbilityStore())
        }
    }
}
