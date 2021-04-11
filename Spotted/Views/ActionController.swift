//
//  ActionController.swift
//  Spotted
//
//  Created by Kyle Thompson on 1/30/21.
//  Copyright © 2021 Kyle Thompson. All rights reserved.
//

import SwiftUI

class ActionController: ObservableObject {
//    @Published var currentAction: ActionState = .navigate
//    @Published var recievingPlayer: Player
//    @Published var givingPlayer: Player
//
//    func add(count: Int) {
//
//    }
//
//    func steal() {
//
//    }
}

enum ActionState: Int {
    case spot = 0
    case steal = 1
    case navigate = 2
}
