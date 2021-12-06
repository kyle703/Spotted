//
//  PlayerView.swift
//  SpottedAgain
//
//  Created by Kyle Thompson on 11/6/21.
//

import SwiftUI

struct PlayerView: View {
    var player: Player = Player.players[0]
    var position: Int = 2
    
    var body: some View {
        ZStack {
            Color.primaryWhite.ignoresSafeArea(edges: .top)
            
            VStack {
                VStack {
                    PlayerIcon(imageName: player.icon, bgColor: player.color).overlay(Badge(count: position).font(.system(size: 32)))
                    Text("\(player.name)").font(.system(size: 32))
                    Text(verbatim: Int.formatNumber(player.score)).font(.system(size: 24)).fontWeight(.light)
                }
                .padding()
                .frame(maxHeight: 250)
                .background(Color.white)
                .clipShape(RoundedRectangle(cornerRadius: 25.0))
                .shadow(radius: 10)

                
                VStack (alignment: .leading, spacing: 0) {
                    HStack {
                        Text("Overview").font(.largeTitle).padding(.leading)
                        Spacer()
                    }
                    
                    ScrollView(.horizontal) {
                        LazyHStack {
                            PlayerStatCard(color: .red, title: "Nemesis", icon: "flame.fill", content: Text("Mike"))
                            PlayerStatCard(color: .secondaryBlue, title: "Spotted", icon: "eyes", content: Text("12.12K"))
                            PlayerStatCard(color: .primaryGreen, title: "Stolen", icon: "mustache.fill", content: Text("4.2K"))
                            PlayerStatCard(color: .secondaryGreen, title: "Lost", icon: "hands.clap.fill", content: Text("10.2K"))
                        }.padding()
                    }.frame(maxWidth: .infinity, maxHeight: 200)
                }.ignoresSafeArea(edges: .horizontal)
                Spacer()
            }
        }
    }
}

struct PlayerStatCard: View {
    var color: Color = .secondaryGreen
    var title: String = "Title"
    var icon: String = "eyes"
    var content: Text
    var body: some View {
        ZStack(alignment: .topLeading) {
            Color.white
            
            HStack {
                VStack (alignment: .leading) {
                    HStack {
                        SFIcon(color: color, sfName: icon)
                        Text(title).font(.title2)
                    }
                    content.font(.largeTitle).bold()
                }.padding()
                Spacer()
            }
        }
        .frame(width: 175, height: 150, alignment: .center)
        .clipShape(RoundedRectangle(cornerRadius: 25))
        .shadow(radius: 10 )
    }
}

struct SFIcon: View {
    var color: Color
    var sfName: String
    var body: some View {
        ZStack {
            color.opacity(0.4).clipShape(Circle()).frame(width: 30, height: 30)
            Image(systemName: sfName).foregroundColor(color)
        }
    }
}

struct PlayerView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerView()
    }
}
