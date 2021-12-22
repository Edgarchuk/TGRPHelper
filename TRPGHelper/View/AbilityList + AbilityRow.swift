import SwiftUI
import Combine


struct AbilityList: View {

    @EnvironmentObject var abilityStore: AbilityListViewModel

    var body: some View {
        VStack {
            List(selection: self.$abilityStore.selectedAbility) {
                ForEach(Array(abilityStore.abilities.enumerated()),
                        id: \.element) { index, Ability in
                    AbilityRow(Ability: Ability)
              }
            }
            .listStyle(SidebarListStyle())
            Spacer()
            HStack {
                Button("+") {
                    abilityStore.createNewAbility()
                }
                .buttonStyle(.borderless)
                .font(.largeTitle)
                Button("-") {
                    abilityStore.deleteSelectAbility()
                }
                .buttonStyle(.borderless)
                .font(.largeTitle)
                Spacer()
            }
            .padding(.leading, 5)
            .background(.background)
            
        }
    }
}

struct AbilityRow: View {
    var Ability: Ability

    var body: some View {
        Text("\(Ability.name)")
            .padding(12)
    }
}
