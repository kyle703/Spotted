//
//  ActionView.swift
//  SpottedAgain
//
//  Created by Kyle Thompson on 11/6/21.
//

import SwiftUI

struct ActionView: View {
    @EnvironmentObject var game: Game
    @Environment(\.presentationMode) var presentationMode
    @State private var selected: Player?
    @ObservedObject private var num = NumbersOnly();
    
    private var isDisabled: Bool {
        return num.value.count == 0 || selected == nil
    }
    
    var helperText: String {
        get {
            if (selected == nil) {
                return "Who spotted them?"
            }
            if (num.value.count == 0) {
                return "How many did \(selected!.name) spot?"
            }
            return "Add \(Int(num.value)!) to \(selected!.name)?"
        }
    }

    var body: some View {
        VStack(spacing: 10) {
            Text("My Cows!").font(.title)
            
            Form {
                Section {
                    Text("Who spotted 'em?").font(.title2)
                    PlayerSelection(selection: $selected, players: game.sorted, numRows: 1)
                }
                
                Section {
                    TextField("How many?", text: $num.value)
                                .padding()
                                .keyboardType(.decimalPad)
                }
            }
            
            HStack {
                Button(helperText) {
                    if let index = game.players.firstIndex(where: { $0.id == selected!.id }) {
                        game.players[index].score += Int(num.value)!;
                    }
                
                    presentationMode.wrappedValue.dismiss()
                }
                .disabled(isDisabled)
                .buttonStyle(ModalButtonStyle(disabled: isDisabled))
                
            }.padding()
                
        }
        .padding()
        
    }
}

class NumbersOnly: ObservableObject {
    @Published var value = "" {
        didSet {
            let filtered = value.filter { $0.isNumber }
            
            if value != filtered {
                value = filtered
            }
        }
    }
}

struct ActionView_Previews: PreviewProvider {
    static var previews: some View {
        ActionView().environmentObject(Game.dummyGame)
    }
}
