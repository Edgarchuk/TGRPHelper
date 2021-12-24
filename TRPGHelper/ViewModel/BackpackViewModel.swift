//
//  File.swift
//  TRPGHelper
//
//  Created by Эдгар Назыров on 24.12.2021.
//

import Foundation
import Combine

class BackpackViewModel: ObservableObject {
    @Published var backpack: Backpack = .init()
}
