//
//  PlayerDetail.swift
//  Spotted
//
//  Created by Kyle Thompson on 10/4/20.
//  Copyright © 2020 Kyle Thompson. All rights reserved.
//

import SwiftUI

struct PlayerDetail: View {
    var player: Player
    
    var body: some View {
        VStack {
            Spacer() // TODO: Replace with custom map view with current user actions mapped
            CircleImage(image: Image(player.imageName ?? "turtlebeach"))
                .offset(x: 0, y: -130)
                .padding(.bottom, -130)
            
            VStack(alignment: .leading) {
                HStack {
                    Text(player.firstName ?? "Error")
                        .font(.title)
                    
                }
                
                HStack(alignment: .top) {
                    Text(player.firstName ?? "Error")
                        .font(.subheadline)
                    Spacer()
                    Text(player.lastName ?? "Error")
                        .font(.subheadline)
                }
            }
            .padding()
            
            Spacer()
        }
    }
}
