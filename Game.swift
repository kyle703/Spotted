//
//  Game.swift
//  SpottedAgain
//
//  Created by Kyle Thompson on 8/27/21.
//

import SwiftUI
import MapKit

class Game: ObservableObject {
    @Published var title: String = "test"
    @Published var color: Color = .green
    @Published var players: [Player] = []
    @Published var actions: [Action] = []
    
    var sorted: [Player] {
            players.sorted()
    }
    
    var annotations: [MKPointAnnotation] {
        return actions.map(extractCoord)
    }
    
    func extractCoord(action: Action) -> MKPointAnnotation {
        let point = MKPointAnnotation()
        point.coordinate = CLLocationCoordinate2D(latitude: action.coordinates?.latitude ?? 37.54, longitude: action.coordinates?.longitude ?? -77.43)
        point.title = action.toString()
        point.subtitle = action.date.getFormattedDate(format: "MMM d, h:mm a")
        return point;
    }
   
    var created: Date = Date()
    
    init(title: String, players: [Player], color: Color, actions: [Action]) {
        self.title = title;
        self.players = players;
        self.color = color;
        self.actions = actions;
    }
    
    init(title: String) {
        self.title = title
    }
    
}

extension Game {
    static var dummyGame: Game = Game(title: "Test Game", players: Player.players, color: Color.green, actions: Action.sampleActions)
}
