//
//  ActionHistoryView.swift
//  SpottedAgain
//
//  Created by Kyle Thompson on 11/22/21.
//

import SwiftUI

struct ActionHistoryView: View {
    @EnvironmentObject var game: Game
    
    var body: some View {
        List(game.actions) { action in
            NavigationLink(
                destination: ActionDetailView(action: action),
                label: {
                    ActionRow(action: action)
                })
            
        }
    }
}





struct ActionHistoryView_Previews: PreviewProvider {
    static var previews: some View {
        ActionHistoryView().environmentObject(Game.dummyGame)
    }
}
