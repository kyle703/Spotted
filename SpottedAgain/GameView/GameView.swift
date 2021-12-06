//
//  GameView.swift
//  SpottedAgain
//
//  Created by Kyle Thompson on 10/24/21.
//

import SwiftUI

struct GameView: View {
    @EnvironmentObject var game: Game
    @Binding var activeSheet: ActiveSheet?;
    
    var body: some View {
        ZStack {
            VStack {
                
                List(game.players.indices, id: \.self) { i in
                    NavigationLink(
                        destination: PlayerView(player: game.sorted[i], position: i + 1),
                        label: {
                            PlayerRow(player: game.sorted[i], position: i + 1)
                        })
                    
                }
                .listStyle(PlainListStyle())
            }
            VStack(alignment: .trailing) {
                Spacer()
                HStack{
                    Spacer()
                    ActionButton(activeSheet: $activeSheet).frame(width: 150, height: 150)
                }
                .padding()
            }
            
        }
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView(activeSheet: .constant(nil)).environmentObject(Game.dummyGame)
    }
}
