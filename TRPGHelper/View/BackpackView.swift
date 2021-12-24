//
//  BackpackView.swift
//  TRPGHelper
//
//  Created by Эдгар Назыров on 24.12.2021.
//

import Foundation
import Combine
import SwiftUI

struct BackpackView: View {
    @EnvironmentObject var backpackViewModel: BackpackViewModel
    var body: some View {
        VStack {
            List() {
                ForEach(backpackViewModel.backpack.items) {item in
                    HStack {
                        TextField("Item", text: Binding(
                            get: {item.name},
                            set: {backpackViewModel.backpack.set(
                                name: $0, for: item)}))
                        Image(systemName: "delete.left")
                    }.onTapGesture {
                        backpackViewModel.backpack.remove(item: item)
                    }
                }
            }
            Spacer()
            HStack {
                Image(systemName: "plus")
                    .onTapGesture {
                        backpackViewModel.backpack.addNewItem()
                    }
                Spacer()
            }.padding()
        }
    }
}

struct BackpackView_Previews: PreviewProvider {
    static var previews: some View {
        BackpackView().environmentObject({ () -> BackpackViewModel in
            let backpackViewModel = BackpackViewModel()
            backpackViewModel.backpack.addNewItem()
            return backpackViewModel
        }())
    }
}
