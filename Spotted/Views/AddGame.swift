//
//  AddGame.swift
//  Spotted
//
//  Created by Kyle Thompson on 1/10/21.
//  Copyright © 2021 Kyle Thompson. All rights reserved.
//

import SwiftUI

struct AddGame: View {
    
    static let defaultName = "An untitled masterpiece"
    static let defaultImageName = "turtlerock"
    
    @State var name = ""
    @State var imageName = ""
    let onComplete: (String, String) -> Void
    
    var body: some View {
        NavigationView {
          Form {
            Section(header: Text("Name")) {
              TextField("Name", text: $name)
            }
            Section(header: Text("Icon")) {
                CircleImage(image: Image("turtlerock"))
            }
            Section {
              Button(action: addGameAction) {
                Text("Create Game")
              }
            }
          }
          .navigationBarTitle(Text("New Game"), displayMode: .inline)
        }
      }

      private func addGameAction() {
        onComplete(
          name.isEmpty ? AddGame.defaultName : name,
          imageName.isEmpty ? AddGame.defaultImageName : imageName
          )
      }
}
