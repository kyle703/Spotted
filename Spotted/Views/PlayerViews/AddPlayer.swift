//
//  AddPlayer.swift
//  Spotted
//
//  Created by Kyle Thompson on 1/10/21.
//  Copyright © 2021 Kyle Thompson. All rights reserved.
//

import SwiftUI

struct AddPlayer: View {
    static let defaultFirstName = "First"
    static let defaultLastName = "Last"
    static let defaultImageName = "turtlerock"

    @State var firstName = ""
    @State var lastName = ""
    @State var imageName = ""
    
    let onComplete: (String, String, String) -> Void

    var body: some View {
        NavigationView {
          Form {
            Section(header: Text("Name")) {
                VStack {
                    TextField("First Name", text: $firstName)
                    TextField("Last Name", text: $lastName)
                }
            }
            Section(header: Text("Icon")) {
                CircleImage(image: Image("turtlerock"))
            }
            Section {
              Button(action: addPlayerAction) {
                Text("Add Player")
              }
            }
          }
          .navigationBarTitle(Text("New Player"), displayMode: .inline)
        }
      }

      private func addPlayerAction() {
        onComplete(
            firstName.isEmpty ? AddPlayer.defaultFirstName : firstName,
            lastName.isEmpty ? AddPlayer.defaultLastName : lastName,
            imageName.isEmpty ? AddPlayer.defaultImageName : imageName)
      }
}
