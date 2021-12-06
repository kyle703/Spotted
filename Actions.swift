//
//  Actions.swift
//  SpottedAgain
//
//  Created by Kyle Thompson on 8/27/21.
//

import SwiftUI
import CoreLocation

struct Action : Identifiable, Hashable {
    static func == (lhs: Action, rhs: Action) -> Bool {
        lhs.id == rhs.id
    }
    
    let id = UUID()
    var playerTo: Player
    var playerFrom: Player?
    var amount: Int
    var type: ActionType
    var date: Date
    var coordinates: Coords?
    
    func toString() -> String {
        switch type {
        case .add:
            return "\(playerTo.name) spotted \(Int.formatNumber(amount))"
        case .steal:
            return "\(playerTo.name) stole \(Int.formatNumber(amount)) from \(playerFrom!.name)"
        case .penalty:
            return "\(playerTo.name) lost \(Int.formatNumber(amount))"
        }
    }
}

struct Coords : Hashable {
    var latitude: Double
    var longitude: Double
}

enum ActionType {
    case add, steal, penalty
}


extension Action {
       static var sampleActions =
        [
            Action(playerTo: Player.players[0], playerFrom: nil, amount: 10, type: ActionType.add, date: Date()),
            Action(playerTo: Player.players[1], playerFrom: nil, amount: 15, type: ActionType.add, date: Date()),
            Action(playerTo: Player.players[0], playerFrom: nil, amount: 40, type: ActionType.add, date: Date()),
            Action(playerTo: Player.players[2], playerFrom: nil, amount: 12, type: ActionType.add, date: Date()),
            Action(playerTo: Player.players[3], playerFrom: Player.players[0], amount: 25, type: ActionType.steal, date: Date()),
            Action(playerTo: Player.players[2], playerFrom: nil, amount: 10, type: ActionType.add, date: Date()),
            Action(playerTo: Player.players[3], playerFrom: nil, amount: 5, type: ActionType.penalty, date: Date()),
            Action(playerTo: Player.players[2], playerFrom: nil, amount: 10, type: ActionType.add, date: Date()),
        ]
}
