//
//  ContentView.swift
//  SpottedAgain
//
//  Created by Kyle Thompson on 8/27/21.
//

import SwiftUI

enum ActiveSheet: Identifiable {
    case addPlayer, addPoints, stealPoints
    
    var id: Int {
        hashValue
    }
}

struct ContentView: View {
    @EnvironmentObject var game: Game
    @State private var activeSheet: ActiveSheet?

    var body: some View {
        TabView {
            NavigationView {
                GameView(activeSheet: $activeSheet)
                    .navigationBarTitle("Scoreboard")
                    .navigationBarItems(trailing: AddPlayerButton(activeSheet: $activeSheet))
                    .sheet(item: $activeSheet) { item in
                                switch item {
                                case .addPlayer:
                                    AddPlayerModal().environmentObject(game)
                                case .addPoints:
                                    ActionView().environmentObject(game)
                                case .stealPoints:
                                    StealView().environmentObject(game)
                            }
                    }
            }.tabItem {
                Label("Scoreboard", systemImage: "house").accentColor(.blue)
            }
            
            NavigationView {
                ActionHistoryView()
                .navigationBarTitle("Activity")
            }.tabItem { Label("Activity", systemImage: "list.dash") }
            
            ActionMapView().tabItem { Label("Map", systemImage: "map") }
        }
    }
}

struct AddPlayerButton: View {
    @Binding var activeSheet: ActiveSheet?;
    var body: some View {
        Button(action: {
            activeSheet = .addPlayer
        }) {
            Image(systemName: "person.fill.badge.plus").imageScale(.large)
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(Game.dummyGame)
    }
}
