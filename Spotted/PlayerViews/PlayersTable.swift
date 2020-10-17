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

    var body: some View {
        NavigationView {
            VStack {
                PlayerList(players: userData.players)
                ActionSelector()
            }
        }
        .navigationBarTitle(Text("Players"))
    }
}

struct PlayersTable_Previews: PreviewProvider {
    static var previews: some View {
        PlayersTable()
    }
}
