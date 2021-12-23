import SwiftUI

struct PlayerInfoView: View {
    @EnvironmentObject var player: PlayerViewModel
    
    var body: some View {
        VStack {
            TextField("Name", text: Binding(
                get: { player.player.name },
                set: { player.player.name = $0 }))
                .padding()
                .textFieldStyle(.plain)
            TextEditor(text: Binding(
                get: { player.player.bio },
                set: { player.player.bio = $0 }))
                .padding()
        }
    }
}

struct PlayerInfoView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerInfoView().environmentObject(PlayerViewModel())
    }
}
