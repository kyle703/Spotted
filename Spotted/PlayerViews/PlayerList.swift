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
    
    
    static var playerCardGradient = LinearGradient(gradient: Gradient(colors: [Color("CoolBlue"), Color("CoolSkyBlue"), Color.white]), startPoint: .leading, endPoint: .trailing)
    
    var body: some View {
        List {
            ForEach(players) { player in
                NavigationLink(
                    destination: PlayerDetail(player: player)
                ) {
                    PlayerRow(player: player)
                }
                .playerCardStyle(wiggle: false)
            }
        }
    }

}

extension View {
    
    func playerCardStyle(wiggle: Bool) -> some View {
        self
        .padding()
        .background(PlayerList.playerCardGradient)
        .cornerRadius(20)
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color.black, lineWidth: 4)
        )
        .if(wiggle) { view in
            view.animation(Animation.easeInOut(duration: 0.15).repeatForever(autoreverses: true))
        }
    }
}

struct LandmarksList_Previews: PreviewProvider {
    static var players = [MockPlayer.player]
    static var previews: some View {
        PlayerList(players: players)
        .environmentObject(UserData())
    }
}

