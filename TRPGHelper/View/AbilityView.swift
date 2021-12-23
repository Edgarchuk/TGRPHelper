import SwiftUI

struct AbilityView: View {
    
    @EnvironmentObject var abilityStore: AbilityListViewModel
    
    var body: some View {
        HStack {
            AbilityList().frame(width: 200)
            if self.abilityStore.selectedAbility != nil {
                AbilityDetail()
            }
        }.frame(alignment: .leading)
    }
}
