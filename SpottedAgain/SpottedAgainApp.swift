//
//  SpottedAgainApp.swift
//  SpottedAgain
//
//  Created by Kyle Thompson on 8/27/21.
//

import SwiftUI

@main
struct SpottedAgainApp: App {
    @StateObject var game: Game = Game.dummyGame
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(game)
        }
    }
}
