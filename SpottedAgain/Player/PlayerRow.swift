//
//  PlayerRow.swift
//  SpottedAgain
//
//  Created by Kyle Thompson on 11/1/21.
//

import SwiftUI

struct PlayerRow: View {
    var player: Player = Player.players[0];
    var position: Int = 1
    var body: some View {
        
        HStack {
            PlayerIcon(imageName: player.icon, bgColor: player.color)
                .frame(width: 100, height: 100)
                .overlay(Badge(count: position).font(.system(size: 18)))
            
            Text(player.name).bold().font(.title3)
            
            Spacer()
            
            Text(Int.formatNumber(player.score)).fontWeight(.light).font(.title2)
            
        }.padding().clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous)).listRowBackground(Color.clear)
        
    }
}

struct MedalGradient: View {
    var colors: [Color] = [.orange, .white, .orange, .white]
    var body: some View {
            RadialGradient(
                gradient: Gradient(colors: colors + colors),
                center: .center,
                startRadius: 1,
                endRadius: 30
            )
        }
}

struct PlayerRow_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            PlayerRow()
            HStack{
                Badge(count: 1)
                Badge(count: 2)
                Badge(count: 3)
            }.padding()
            MedalGradient(colors: [Color.primaryGold, Color.secondaryGold, Color.primaryGold, Color.secondaryGold]).clipShape(Circle())
        }
       
    }
}
