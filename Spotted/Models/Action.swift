//
//  Action.swift
//  Spotted
//
//  Created by Kyle Thompson on 10/4/20.
//  Copyright © 2020 Kyle Thompson. All rights reserved.
//

/*
 Abstract:
 The model for actions taken by players in a game, such as add or steal.
 */

import SwiftUI
import CoreLocation

struct Action: Hashable, Codable, Identifiable {
    var id: Int
    var actionType: ActionType
    var datetime: Date
    fileprivate var coordinates: Coordinates
    var playerTo: Player
    var playerFrom: Player
    
    var isActive: Bool
    
    enum ActionType: String, Codable, Hashable {
        case add = "Add"
        case steal = "Steal"
    }
    
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: coordinates.latitude,
            longitude: coordinates.longitude)
    }
}

struct Coordinates: Hashable, Codable {
    var latitude: Double
    var longitude: Double
}
