//
//  ActionBar.swift
//  Spotted
//
//  Created by Kyle Thompson on 12/22/20.
//  Copyright © 2020 Kyle Thompson. All rights reserved.
//

import SwiftUI

struct ActionBar: View {
    
    private static let addButtonGradient = LinearGradient(gradient: Gradient(colors: [Color("Navy"), Color("GreenYellow")]), startPoint: .leading, endPoint: .trailing)
    private static let stealButtonGradient = LinearGradient(gradient: Gradient(colors: [Color("HotRed"), Color("DarkPurple")]), startPoint: .leading, endPoint: .trailing)
    
    @Binding var actionState: ActionState
    private let items: [String] = ["Spot", "Steal"]
        
    var body: some View {
        VStack {
            if actionState == ActionState.spot {
                Text("Select the user who spotted the cows")
            } else if actionState == ActionState.steal {
                Text("Which player spotted the beaver")
            }
            ActionPicker(items: self.items, selection: self.$actionState)
            if actionState != ActionState.navigate {
                HStack {
                    Spacer()
                    ActionButton(gradient: ActionBar.addButtonGradient, label: "Confirm", action: confirm)
                    Spacer()
                    ActionButton(gradient: ActionBar.stealButtonGradient, label: "Cancel", action: cancel)
                    Spacer()
                }
            }
        }
    }
    
    func confirm() -> Void {
        print("Confirm: \(items[actionState.rawValue])")
        actionState = .navigate
    }

    func cancel() -> Void {
        print("Cancel")
        actionState = .navigate
    }
    
}
