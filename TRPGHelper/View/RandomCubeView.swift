import SwiftUI
import Combine

struct RandomCubeView: View {
    @EnvironmentObject var abilityStore: AbilityListViewModel
    @State private var randomNumber: Int?
    @State private var cubeColor: Color = .blue
    var body: some View {
        VStack {
            Button("Drop Cube") {
                let rowRandomNumber = Int.random(in: 1...20)
                randomNumber = rowRandomNumber + abilityStore.selectedAbility!.getBonus()
                
                withAnimation(.easeIn(duration: 0.1)) {
                    if rowRandomNumber == 1 {
                        cubeColor = .red
                    } else if rowRandomNumber == 20 {
                        cubeColor = .green
                    } else {
                        cubeColor = .blue
                    }
                }
                
            }
            ZStack {
                Image(systemName: "pentagon")
                    .resizable()
                    .foregroundColor(cubeColor)
                if let randomNumber = randomNumber {
                    Text("\(randomNumber)")
                        .font(.largeTitle)
                }
            }
            .frame(width: 100, height: 100)
        }
    }
}
