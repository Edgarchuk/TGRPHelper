import SwiftUI

struct SingleSelectionList<Item: Identifiable, Content: View>: View {
    
    var items: [Item]
    @Binding var selectedItem: Item
    var rowContent: (Item) -> Content
    
    var body: some View {
        List(items) { item in
            HStack {
                rowContent(item)
                    .contentShape(Rectangle())
                    .onTapGesture {
                        self.selectedItem = item
                    }
                Checkmark(checked: item.id == self.selectedItem.id)
            }
        }
    }
}

struct Checkmark: View {
    var checked: Bool = false
    var body: some View {
        if checked {
            ZStack(alignment: .trailing) {
                Image(systemName: "circle.fill")
                    .resizable()
                    .frame(width: 10, height: 10)
                    .foregroundColor(.accentColor)
                    .shadow(radius: 1)
            }
        }
    }
}
