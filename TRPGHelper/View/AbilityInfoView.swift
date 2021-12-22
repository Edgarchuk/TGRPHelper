import SwiftUI
import Combine

struct AbilityInfoView: View {
    @EnvironmentObject var abilityStore: AbilityListViewModel
    var body: some View {
        VStack {
            HStack {
                Text("Name:")
                TextField("Name", text: Binding (
                    get: {
                        abilityStore.selectedAbility?.name ?? ""
                    },
                    set: {
                        abilityStore.selectedAbility?.name = $0
                    })
                ).textFieldStyle(.plain)
            }
            .padding(.leading)
            .padding(.top)
            HStack {
                Text("Bonus:")
                TextField("Bonus", text: Binding (
                    get: {
                        abilityStore.selectedAbility?.bonus.description ?? ""
                    },
                    set: {
                        abilityStore.selectedAbility?.bonus = Int($0) ?? 0
                    })
                ).textFieldStyle(.plain)
            }
            .padding(.leading)
        }
    }
}
