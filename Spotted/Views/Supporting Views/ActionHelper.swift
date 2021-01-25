//
//  ActionHelper.swift
//  Spotted
//
//  Created by Kyle Thompson on 12/27/20.
//  Copyright © 2020 Kyle Thompson. All rights reserved.
//

import SwiftUI

struct ActionHelper: View {
    
    var actionState: ActionState
    var selectedPlayer: Player?
    
    var body: some View {
        if actionState != .navigate {
            Text(getHelperText())
            .fontWeight(.bold)
            .font(.callout)
            .foregroundColor(.purple)
            .padding()
            .border(Color.purple, width: 5)
            .cornerRadius(6)
        }
    }
    
    private func getHelperText() -> String {
        var ret = "";
        if actionState == .spot {
            ret = "Who spotted it?"
        } else if actionState == .steal {
            if selectedPlayer != nil {
                ret = "Who's stealing?"
            } else {
                ret = "Who's getting robbed?"
            }
        }
        return ret;
    }
}
