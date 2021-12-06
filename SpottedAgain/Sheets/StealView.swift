//
//  StealView.swift
//  SpottedAgain
//
//  Created by Kyle Thompson on 11/12/21.
//

import SwiftUI

struct StealView: View {
    @EnvironmentObject var game: Game
    @Environment(\.presentationMode) var presentationMode
    @State private var selectedTo: Player?
    @State private var selectedFrom: Player?
    
    private var isDisabled: Bool {
        return selectedFrom == nil || selectedTo == nil
    }
    
    var buttonText: String {
        get {
            if (selectedTo == nil) {
                return "Who spotted the Beaver?"
            }
            if (selectedFrom == nil) {
                return "Who is \(selectedTo!.name) stealing from?"
            }
            return "\(selectedTo!.name) is stealing \(points) cows from \(selectedFrom!.name)"
        }
    }
    
    var points: Int {
        get {
            if (isDisabled) {
                return 0;
            }
            return selectedFrom!.score / 2
        }
    }

    var body: some View {
        VStack(spacing: 10) {
            Text("Beaver!").font(.title)
            
            Form {
                Section {
                    Text("Who spotted 'em?").font(.title2)
                    PlayerSelection(selection: $selectedTo, players: game.sorted, numRows: 1)
                }
                
                Section {
                    Text("Stealing from?").font(.title2)
                    PlayerSelection(selection: $selectedFrom, players: game.sorted.filter { player in return player.id != selectedTo?.id}, numRows: 1)
                }
            }
            
            HStack {
                Button(buttonText) {
                    let indexFrom = game.players.firstIndex(where: { $0.id == selectedFrom!.id })
                    let indexTo = game.players.firstIndex(where: { $0.id == selectedTo!.id })
                    
                    game.players[indexFrom!].score -= points;
                    game.players[indexTo!].score += points;
                
                    presentationMode.wrappedValue.dismiss()
                }
                .disabled(isDisabled)
                .buttonStyle(ModalButtonStyle(disabled: isDisabled))
                
            }.padding()
        }
        .padding()
    }

}

struct StealView_Previews: PreviewProvider {
    static var previews: some View {
        StealView()
    }
}
