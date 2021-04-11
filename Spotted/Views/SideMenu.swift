//
//  SideMenu.swift
//  Spotted
//
//  Created by Kyle Thompson on 2/12/21.
//  Copyright © 2021 Kyle Thompson. All rights reserved.
//

import SwiftUI

struct MenuButton: Identifiable {
    var id = UUID()
    var text: String
    var sfsymbol: String
    var action: () -> Void
}

@available(iOS 14.0, *)
struct SideMenu: View {
    
    @ObservedObject var viewRouter: ViewRouter
    @ObservedObject var gameStorage: GameStorage
    
    var buttons: [MenuButton]
    
    init(viewRouter: ViewRouter, gameStorage: GameStorage) {
        self.viewRouter = viewRouter
        self.gameStorage = gameStorage
        
        buttons = [
            MenuButton(text: "Scoreboard", sfsymbol: "person.fill.badge.plus", action: {viewRouter.currentPage = .playerList}),
            MenuButton(text: "Statistics", sfsymbol: "chart.pie", action: {viewRouter.currentPage = .analytics}),
            MenuButton(text: "Game Log", sfsymbol: "scroll", action: {viewRouter.currentPage = .actionLog}),
            MenuButton(text: "Settings", sfsymbol: "gear", action: {viewRouter.currentPage = .settings})
        ]
     }
    


    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                GameDropDown(gameStorage: gameStorage)
                    .frame(width: 150)
                VStack {
                    ForEach(buttons, id: \.id) { button in
                        Button(action: button.action, label: {
                            HStack {
                                Image(systemName: button.sfsymbol)
                                Text(button.text)
                            }.foregroundColor(.black).padding()
                        })
                    }
                }
            }.edgesIgnoringSafeArea(.all)
            Spacer()
        }
    }
}
