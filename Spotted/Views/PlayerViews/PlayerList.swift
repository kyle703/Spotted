//
//  PlayerList.swift
//  Spotted
//
//  Created by Kyle Thompson on 10/4/20.
//  Copyright © 2020 Kyle Thompson. All rights reserved.
//

import SwiftUI

struct PlayerList: View {
    var players: [Player]
    var actionState: ActionState
    @Binding var selectedPlayer: Player?
    @State private var isActive = false
    
    func isPlayerDetailActive(player: Player) -> Binding<Bool> {
        return Binding(
            get: { return player == selectedPlayer && actionState == .navigate },
            set: { isActive = $0 }
        )
    }
    
    var body: some View {
        List {
            ForEach(players, id: \.self) { player in
                NavigationLink(destination: PlayerDetail(player: player), isActive: isPlayerDetailActive(player: player)) {
                    PlayerRow(player: player, selectedPlayer: selectedPlayer, actionState: actionState)
                }
                .onTapGesture {
                        self.handleTap(player: player)
                }
            }
        }
    }
    
    func handleTap(player: Player) -> Void {
        print("tapped \(player.firstName!)")
        self.selectedPlayer = player
    }

}

struct Shake: GeometryEffect {
    var amount: CGFloat = 10
    var shakesPerUnit = 3
    var animatableData: CGFloat

    func effectValue(size: CGSize) -> ProjectionTransform {
        ProjectionTransform(CGAffineTransform(translationX:
            amount * sin(animatableData * .pi * CGFloat(shakesPerUnit)),
            y: 0))
    }
}


