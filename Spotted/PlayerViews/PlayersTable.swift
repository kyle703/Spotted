//
//  PlayersTable.swift
//  Spotted
//
//  Created by Kyle Thompson on 10/17/20.
//  Copyright © 2020 Kyle Thompson. All rights reserved.
//

import SwiftUI

struct PlayersTable: View {
    @EnvironmentObject private var userData: UserData
    
    
    private static let addButtonGradient = LinearGradient(gradient: Gradient(colors: [Color("Navy"), Color("GreenYellow")]), startPoint: .leading, endPoint: .trailing)
    private static let stealButtonGradient = LinearGradient(gradient: Gradient(colors: [Color("HotRed"), Color("DarkPurple")]), startPoint: .leading, endPoint: .trailing)
    
    static var addButtonModel = ActionButtonModel(id: 0, gradient: PlayersTable.addButtonGradient, isSelected: true, text: "Add", action: {print("add")} )
    static var stealButtonModel = ActionButtonModel(id: 1, gradient: PlayersTable.stealButtonGradient, isSelected: false, text: "Steal", action: {print("steal")})
    
    @ObservedObject var actionList = ActionButtonList(actions: [addButtonModel, stealButtonModel]);

    var body: some View {
        NavigationView {
            VStack {
                PlayerList(players: userData.game.players)
                .navigationBarTitle(Text("Players"))
                ActionSelector(actions: actionList.actions)
            }
        }
        
    }
    
}



struct PlayersTable_Previews: PreviewProvider {
    static var previews: some View {
        PlayersTable()
    }
}
