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
        
    var body: some View {
        HStack {
            player.image
                .resizable()
                .frame(width: 50, height: 50)
                .clipShape(Circle())
            VStack {
                Text(player.firstName)
                    .font(.title)
                Text("\(player.score)🐄")
                    .font(.footnote)
            }
            
            Spacer()
        }
    }
}

struct PlayerRow_Previews: PreviewProvider {
    
    static var previews: some View {
         Group {
                   PlayerRow(player: playerData[0])
                   PlayerRow(player: playerData[1])
               }
               .previewLayout(.fixed(width: 300, height: 70))
    }
}
