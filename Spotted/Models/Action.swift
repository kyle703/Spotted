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
    var actionType = ActionType.none
    var datetime: Date
    fileprivate var coordinates: Coordinates?
    var playerTo: Player?
    var playerFrom: Player?
    
    var isActive: Bool
    
    enum ActionType: String, Codable, Hashable {
        case add = "Add"
        case steal = "Steal"
        case none = "No Action"
    }
    
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: coordinates?.latitude ?? 0.0,
            longitude: coordinates?.longitude ?? 0.0)
    }
    
    
}

struct Coordinates: Hashable, Codable {
    var latitude: Double
    var longitude: Double
}

class ActionButtonModel: Identifiable, ObservableObject {
    var id: Int
    var gradient: LinearGradient
    @Published var isSelected: Bool
    var text: String
    var action: () -> Void
   
    init (id: Int, gradient: LinearGradient, isSelected: Bool, text: String, action: @escaping () -> Void) {
        self.id = id
        self.gradient = gradient
        self.isSelected = isSelected
        self.text = text
        self.action = action
    }
}

class ActionButtonList: ObservableObject {
    @Published var actions = [ActionButtonModel]()
    
    
    init(actions: [ActionButtonModel]) {
        self.actions = actions
    }
    func appendAction(action: ActionButtonModel) {
        objectWillChange.send()
        actions.append(action);
    }
    
}
