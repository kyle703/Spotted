//
//  Game.swift
//  Spotted
//
//  Created by Kyle Thompson on 10/4/20.
//  Copyright © 2020 Kyle Thompson. All rights reserved.
//

import SwiftUI

struct Game: Codable, Hashable, Identifiable {
    var id: Int
    var name: String
    var imageName: String
    var players: [Player]
    var gamelog: [Action]
}

extension Game {
    var image: Image {
        ImageStore.shared.image(name: imageName)
    }
}
