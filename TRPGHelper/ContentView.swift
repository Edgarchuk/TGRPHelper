//
//  ContentView.swift
//  TRPGHelper
//
//  Created by Эдгар Назыров on 19.12.2021.
//

import SwiftUI
import Combine


struct ContentView: View {

    @EnvironmentObject var abilityStore: AbilityListViewModel

    var body: some View {
        NavigationView {
            AbilityList()
            if self.abilityStore.selectedAbility != nil {
                AbilityDetail()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        Group {
            ContentView().environmentObject({ () -> AbilityListViewModel in
                let abilityStore = AbilityListViewModel()
                abilityStore.selectedAbility = abilityStore.abilities[0]
                return abilityStore
            }())
        }
    }
}
