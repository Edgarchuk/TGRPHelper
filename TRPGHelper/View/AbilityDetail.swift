import SwiftUI
import Combine

struct AbilityDetail: View {
    @EnvironmentObject var abilityStore: AbilityListViewModel

    var body: some View {
        VStack {
            if abilityStore.selectedAbility != nil {
                AbilityInfoView()
                HStack {
                    EffectListView()
                    RandomCubeView().padding()
                    Spacer()
                }
                Spacer()
            }
        }
    }
}
