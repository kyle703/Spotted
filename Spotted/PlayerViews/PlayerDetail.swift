//
//  PlayerDetail.swift
//  Spotted
//
//  Created by Kyle Thompson on 10/4/20.
//  Copyright © 2020 Kyle Thompson. All rights reserved.
//

import SwiftUI

struct PlayerDetail: View {
    @EnvironmentObject var userData: UserData
    var player: Player
    
    var playerIndex: Int {
        userData.game.players.firstIndex(where: { $0.id == player.id })!
    }
    
    var body: some View {
        VStack {
            Spacer() // TODO: Replace with custom map view with current user actions mapped
            CircleImage(image: player.image)
                .offset(x: 0, y: -130)
                .padding(.bottom, -130)
            
            VStack(alignment: .leading) {
                HStack {
                    Text(player.firstName)
                        .font(.title)
                    
                    Button(action: {
                        self.userData.game.players[self.playerIndex]
                            .isFavorite.toggle()
                    }) {
                        if self.userData.game.players[self.playerIndex]
                            .isFavorite {
                            Image(systemName: "star.fill")
                                .foregroundColor(Color.yellow)
                        } else {
                            Image(systemName: "star")
                                .foregroundColor(Color.gray)
                        }
                    }
                }
                
                HStack(alignment: .top) {
                    Text(player.firstName)
                        .font(.subheadline)
                    Spacer()
                    Text(player.lastName)
                        .font(.subheadline)
                }
            }
            .padding()
            
            Spacer()
        }
    }
}

struct PlayerDetail_Previews: PreviewProvider {
    static var previews: some View {
        let userData = UserData()
        return PlayerDetail(player: userData.game.players[0])
            .environmentObject(userData)
    }
}
