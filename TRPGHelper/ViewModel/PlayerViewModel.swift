
import Foundation
import SwiftUI
import Combine

class PlayerViewModel: ObservableObject {
    @Published var player: Player = .init(name: "None", bio: "None")
}
