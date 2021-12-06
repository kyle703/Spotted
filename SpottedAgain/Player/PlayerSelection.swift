//
//  PlayerSelection.swift
//  SpottedAgain
//
//  Created by Kyle Thompson on 11/7/21.
//

import SwiftUI

struct PlayerSelection: View {
    @Binding var selection: Player?
    var players: [Player] = []
    var numRows: Int?
    var rows: [GridItem] {
        get {
            if numRows != nil {
                return Array(repeating: GridItem(.flexible()), count: numRows!)
            }
            return [GridItem(.flexible()), GridItem(.flexible())]
        }
    }
    
    var body: some View {
         
        ScrollView(.horizontal) {
            LazyHGrid(rows: rows) {
                ForEach(players, id: \.self) { player in
                    Button(action: {
                        selection = player;
                    }) {
                        PlayerCard(player: player)
                    }.buttonStyle(PlayerCardButtonStyle(isSelected: player.id == selection?.id))
                }.buttonStyle(BorderlessButtonStyle())
                
            }
        }
    }
}

struct PlayerSelection_Previews: PreviewProvider {
    static var previews: some View {
        PlayerSelection(selection: .constant(nil), players: Game.dummyGame.sorted).frame(height: 400)
    }
}
