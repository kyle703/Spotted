//
//  GameView.swift
//  Spotted
//
//  Created by Kyle Thompson on 12/27/20.
//  Copyright © 2020 Kyle Thompson. All rights reserved.
//

import SwiftUI

enum ActionState: Int {
    case spot = 0
    case steal = 1
    case navigate = 2
}

enum ActiveSheet: Identifiable {
    case addPlayer, spot
    
    var id: Int {
        hashValue
    }
}

struct GameView: View {
    
    @Environment(\.managedObjectContext) var managedObjectContext
    
    var game: Game

    @State var actionState: ActionState = .navigate
    @State var selectedPlayer: Player?
    @State var activeSheet: ActiveSheet?
    
    var body: some View {
        ZStack(alignment: .bottom) {
            ZStack(alignment: .bottomTrailing) {
                
                PlayerList(players: Array(game.players!) as! [Player], actionState: actionState, selectedPlayer: $selectedPlayer)

                ActionOverlay(spotFunction: spot, stealFunction: steal, cancelFunction: cancel, actionState: actionState)

            }
            ActionHelper(actionState: actionState, selectedPlayer: selectedPlayer)
        }
        .sheet(item: $activeSheet) { item in
            switch item {
            case .addPlayer:
                AddPlayer(onComplete: addPlayer)
            case .spot:
                SpotModal(selectedPlayer: selectedPlayer, onComplete: confirmSpot)
            }
        }
        .navigationBarTitle(game.name ?? "Game")
        .navigationBarItems(trailing: Button(action: { activeSheet = .addPlayer }) { Image(systemName: "plus") })
        
    }
    
    func onComplete(firstName: String, lastName: String, imageName: String) -> Void {
        activeSheet = .none
        addPlayer(firstName: firstName, lastName: lastName, imageName: imageName)
    }
    
    func addPlayer(firstName: String, lastName: String, imageName: String) -> Void {
        let newPlayer = Player(context: managedObjectContext)

        newPlayer.firstName = firstName
        newPlayer.lastName = lastName
        newPlayer.imageName = imageName
        
        newPlayer.addToGame(game)
        try? managedObjectContext.save()
        
        activeSheet = .none
    }
    
    func spot() -> Void {
        actionState = .spot
        activeSheet = .spot
    }
    
    func steal() -> Void {
        actionState = .steal
    }
    
    func cancel() -> Void {
        actionState = .navigate
        selectedPlayer = nil
        activeSheet = .none
    }
    
    func confirmSpot(num: Int32) -> Void {
        guard let player = selectedPlayer else {
            print("No player selected")
            return
        }
        
        player.score += num;
        selectedPlayer = nil
        actionState = .navigate;
        activeSheet = .none
    }
}
