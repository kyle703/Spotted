//
//  PlayerRow.swift
//  Spotted
//
//  Created by Kyle Thompson on 10/4/20.
//  Copyright © 2020 Kyle Thompson. All rights reserved.
//

import SwiftUI


struct PlayerRow: View {
    var player: Player
    var action: ActionState
    
    var body: some View {
      playerCell()
    }
    
    func playerCell() -> some View {
        return playerCard()
                .padding()
                .background(Color.primaryBlack)
                .cornerRadius(10)
    }
    
    func playerCard() -> some View {
        return HStack {
            CircleImage(image: Image(player.imageName ?? "turtlebeach"))
                .frame(width: 55, height: 55)
            VStack {
                HStack {
                    Text(player.firstName ?? "Error")
                        .font(.title)
                        .background(Color.black)
                        .foregroundColor(Color.white)
                    
                    Spacer()
                    
                    Text("\(player.score)")
                        .background(Color.black)
                        .foregroundColor(Color.white)
                    Image("Cow")
                        .resizable()
                        .frame(width: 25, height: 25)
                        .aspectRatio(contentMode: .fill)
                        .padding(2)
                        .background(Color.primaryWhite)
                        .clipShape(Circle())
                }
            }
            Spacer()
        }
    }
    
    @State private var phase: CGFloat = 0
    var selectedPlayer: Player?

    func playerCardOverlay() -> some View {
        return Group {
            if action != .navigate && player != selectedPlayer {
                RoundedRectangle(cornerRadius: 10)
                .strokeBorder(Color.secondaryBlue, style: StrokeStyle(lineWidth: 5, dash: [10], dashPhase: phase))
                .onAppear { self.phase -= 20 }
                .animation(Animation.linear.repeatForever(autoreverses: false))
            } else if action != .navigate && player == selectedPlayer {
                RoundedRectangle(cornerRadius: 10)
                .strokeBorder(Color.secondaryGreen, lineWidth: 5)
            }
        }
    }
}

