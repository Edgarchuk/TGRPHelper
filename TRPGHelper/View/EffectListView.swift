import SwiftUI
import Combine

struct EffectListView: View {
    @EnvironmentObject var abilityStore: AbilityListViewModel
    var body: some View {
        VStack {
            Text("Effects: ")
            List(selection: $abilityStore.selectedAbility) {
                ForEach(abilityStore.selectedAbility!.effects) {effect in
                    HStack {
                        CheckBoxView(checked: Binding(
                            get: { effect.isActive},
                            set: { abilityStore.selectedAbility!.setIsActive(to: effect, value: $0)}))
                        TextField("Name", text: Binding (
                            get: { effect.name },
                            set: { abilityStore.selectedAbility!.setName(to: effect, value: $0)}))
                        TextField("Bonus", value: Binding (
                            get: {
                                return effect.bonus
                            },
                            set: {
                                abilityStore.selectedAbility!.setBouns(to: effect, value: $0)
                            }), formatter: NumberFormatter())
                    }
                }
            }
            .listStyle(.inset)
            Spacer()
            HStack {
                Button("+") {
                    abilityStore.selectedAbility!.addNewEffect()
                }
                .buttonStyle(.borderless)
                .font(.largeTitle)
                Button("-") {
                    
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
