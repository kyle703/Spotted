//
//  ContentView.swift
//  Spotted
//
//  Created by Kyle Thompson on 10/4/20.
//  Copyright © 2020 Kyle Thompson. All rights reserved.
//
import SwiftUI

@available(iOS 14.0, *)
struct ContentView: View {
    
    @Environment(\.managedObjectContext) var managedObjectContext
    
    @FetchRequest(
        entity: Game.entity(),
        sortDescriptors: [
            NSSortDescriptor(keyPath: \Game.id, ascending: false)
        ]
    ) var games: FetchedResults<Game>

    @State var isPresented = false

    
    var body: some View {
        NavigationView {
            ZStack {
                List {
                    ForEach(games, id: \.id) { game in
                        NavigationLink(destination: GameView(game: game), label: { Text("\(game.name!)")})
                    } //                .onDelete(perform: deleteMovie)
                }

                VStack(alignment:.trailing) {
                    Spacer()
                    Button(action: { self.isPresented.toggle() }) {
                        HStack {
                            Text("New Game")
                                .padding()
                            Image(systemName: "plus")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 25, height: 25)
                                .padding()
                        }
                        .foregroundColor(Color.white)
                        .background(Color.secondaryBrown)
                        .cornerRadius(50)
                    }
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar(content: {
                ToolbarItem(placement: .principal, content: {
                    Text("Detail View Title")
                })
            })
        }
        
        .sheet(isPresented: $isPresented) { AddGame(onComplete: onComplete) }
    }
    
    private func onComplete (name: String, imageName: String) -> Void {
        self.addGame(name: name, imageName: imageName)
        self.isPresented = false
    }
    
    func addGame(name: String, imageName: String) {
        let newGame = Game(context: managedObjectContext)

        newGame.name = name
        newGame.imageName = imageName
        newGame.id = UUID()

      }

}

extension View {
    @ViewBuilder
    func `if`<Content: View>(_ condition: Bool, content: (Self) -> Content) -> some View {
        if condition {
            content(self)
        }
        else {
            self
        }
    }
}

struct StatefulPreviewWrapper<Value, Content: View>: View {
    @State var value: Value
    var content: (Binding<Value>) -> Content

    var body: some View {
        content($value)
    }

    init(_ value: Value, content: @escaping (Binding<Value>) -> Content) {
        self._value = State(wrappedValue: value)
        self.content = content
    }
}

