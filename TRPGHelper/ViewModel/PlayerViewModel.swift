
import Foundation
import Combine

class PlayerViewModel: ObservableObject {
    @Published var player: Player = .init(name: "None", bio: "None")
}
