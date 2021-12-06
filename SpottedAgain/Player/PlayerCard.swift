//
//  PlayerCard.swift
//  SpottedAgain
//
//  Created by Kyle Thompson on 11/6/21.
//

import SwiftUI

struct PlayerCard: View {
    var player: Player
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25).foregroundColor(player.color)
            
            VStack {
                PlayerIcon(imageName: player.icon, bgColor: player.color)
                
                VStack {
                    Text("\(player.name)").bold()
                    Text(verbatim: Int.formatNumber(player.score)).fontWeight(.light)
                }
                .frame(maxWidth: .infinity)
                .background(Color.primaryWhite)
                .foregroundColor(.black)
                .clipShape(RoundedRectangle(cornerRadius: 25))
                
            }.padding()
        }
    }
}

struct PlayerCardButtonStyle: ButtonStyle {
    var isSelected: Bool = true;
    func makeBody(configuration: Self.Configuration) -> some View {

        configuration.label
            .overlay(isSelected ? Color.white.opacity(0.4) : Color.clear)
            .clipShape(RoundedRectangle(cornerRadius: 25))
            .animation(.linear)
    }
}

struct SelectableButtonStyle: ButtonStyle {

    var isSelected = false

    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .padding()
            .background(Color(#colorLiteral(red: 1, green: 0.8980392157, blue: 0.7058823529, alpha: 1)))
            .clipShape(RoundedRectangle(cornerRadius: isSelected ? 16.0 : 0.0))
            .overlay(RoundedRectangle(cornerRadius: isSelected ? 16.0 : 0.0).stroke(lineWidth: isSelected ? 2.0 : 0.0).foregroundColor(Color.pink))
            .animation(.linear)
    }
}

struct PlayerCard_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            PlayerCard(player: Player.players[0]).frame(width: 200, height: 200)
            PlayerCard(player: Player.players[0]).frame(width: 150, height: 150)
            PlayerCard(player: Player.players[0]).frame(width: 100, height: 100)
        }
    }
}
