import SwiftUI

struct Sidebar: View {
    var body: some View {
        NavigationView {
            List {
                NavigationLink(destination: AbilityView()) {
                    Label("Ability", systemImage: "eye")
                }
                NavigationLink(destination: PlayerInfoView()) {
                    Label("Player", systemImage: "gamecontroller")
                }
                NavigationLink(destination: BackpackView()) {
                    Label("Backpack", systemImage: "bag")
                }
                NavigationLink(destination: PlayerSkillsView()) {
                    Label("Skills", systemImage: "bolt")
                }
            }.listStyle(.sidebar)
            .toolbar{
                ToolbarItem(placement: .navigation){
                    Button(action: toggleSidebar, label: {
                        Image(systemName: "sidebar.left")
                    })
                }
            }
        }
    }
}

func toggleSidebar() {
    NSApp.keyWindow?.firstResponder?.tryToPerform(#selector(NSSplitViewController.toggleSidebar(_:)), with: nil)
}
