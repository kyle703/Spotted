//
//  ActionDetailView.swift
//  SpottedAgain
//
//  Created by Kyle Thompson on 11/23/21.
//

import SwiftUI

struct ActionDetailView: View {
    
    var action: Action;
    
    
    var body: some View {
        VStack {
            Color.primaryGreen
                .ignoresSafeArea(edges: .top)
                .frame(height: 150)
            
            
            PlayerIcons(playerTo: action.playerTo, playerFrom: action.playerFrom)
            .offset(y: -100)
            .padding(.bottom, -100)
            
            ActionBody(action: action)
            
            Spacer()
            
        }
    }
}

struct PlayerIcons: View {
    var playerTo: Player
    var playerFrom: Player?
    var body: some View {
        
        if playerFrom != nil {
            HStack {
                PlayerIcon(imageName: playerTo.icon, bgColor: playerTo.color).offset(x: 20)
                PlayerIcon(imageName: playerFrom!.icon, bgColor: playerFrom!.color).offset(x: -20)
            }
            .environment(\.layoutDirection, .rightToLeft)
        } else {
            PlayerIcon(imageName: playerTo.icon, bgColor: playerTo.color).frame(maxWidth: 200)
        }
        
    }
}

struct ActionBody: View {
    var action: Action
    var body: some View {
        VStack (spacing: 10) {
            Text(action.playerTo.name).bold()
            HStack {
                if action.type == .steal {
                Text("stole")
                StealIcon()
                } else {
                    Text("spotted")
                    AddIcon()
                }
            }
            Text("\(action.amount)").bold()
            
            if action.type == .steal {
                Text("from")
                Text(action.playerFrom!.name).bold()
            }
            Text(action.date.getFormattedDate(format: "'on' MMM dd, yyyy 'at' hh:mm a"))
            
        }.font(.title).padding()
    }
}



struct ActionDetailView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ActionDetailView(action: Action.sampleActions[4])
            ActionDetailView(action: Action.sampleActions[0])
        }
    }
}
