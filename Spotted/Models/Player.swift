//
//  Player.swift
//  Spotted
//
//  Created by Kyle Thompson on 10/4/20.
//  Copyright © 2020 Kyle Thompson. All rights reserved.
//

import SwiftUI

struct Player: Hashable, Codable, Identifiable {
    var id: Int
    var firstName: String
    var lastName: String
    fileprivate var imageName: String
    
    var score: Int
    var isFavorite: Bool
    
}

extension Player {
    var image: Image {
        ImageStore.shared.image(name: imageName)
    }
}

struct MockPlayer {
    static var player = Player(id: 1, firstName: "Test", lastName: "Boi", imageName: "turtlerock", score: 12, isFavorite: true)
}


