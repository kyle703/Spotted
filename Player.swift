//
//  Player.swift
//  SpottedAgain
//
//  Created by Kyle Thompson on 8/27/21.
//

import SwiftUI

struct Player : Identifiable, Hashable, Comparable {
    static func < (lhs: Player, rhs: Player) -> Bool {
        return lhs.score > rhs.score
    }
    
    let id = UUID()
    var name: String
    var color: Color = Color.secondaryBlue
    var icon: String = Icons.iconNames.randomElement()!
    var score: Int = 0
}

extension Player {
    static var players: [Player] {
        [
            Player(name: "Jim", color: Color.red, score: 12 ),
            Player(name: "Bob", color: Color.blue, score: 35 ),
            Player(name: "Tony", color: Color.orange, score: 200 ),
            Player(name: "Michael", color: Color.yellow, score: 7 ),
        ]
    }
}
