//
//  ActionOverlay.swift
//  Spotted
//
//  Created by Kyle Thompson on 12/27/20.
//  Copyright © 2020 Kyle Thompson. All rights reserved.
//

import SwiftUI

struct ActionOverlay: View {
    
    var spotFunction: () -> Void
    var stealFunction: () -> Void
    var cancelFunction: () -> Void
    var actionState: ActionState

    var body: some View {
        VStack() {
            Button(action: {
                self.spotFunction()
                }) {
                Image("Cow")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 50, height: 50)
                    .padding()
                    .foregroundColor(Color.white)
                    .background(Color.secondaryGreen)
                    .clipShape(Circle())
            }
            Button(action: {
                self.stealFunction()
                }) {
               Image("Robber")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 50, height: 50)
                    .padding()
                    .foregroundColor(Color.white)
                    .background(Color.secondaryBrown)
                    .clipShape(Circle())
            }
            if actionState != .navigate {
                CancelButton(action: cancelFunction)
            }
        }
        .padding()
    }
    
}

struct CancelButton: View {
    let action: () -> Void
    var body: some View {
        Button(action: action) {
           Image(systemName: "xmark")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 20, height: 20)
                .padding()
                .foregroundColor(Color.white)
                .background(Color.gray)
                .clipShape(Circle())
        }
    }
}

struct ActionOverlay_Previews: PreviewProvider {
    
    private static func spot() -> Void {
        print("Spot")
    }
    
    private static func steal() -> Void {
        print("Steal")
    }
    
    private static func cancel() -> Void {
        print("Steal")
    }
    
    static var previews: some View {
        ActionOverlay(spotFunction: spot, stealFunction: steal, cancelFunction: cancel, actionState: .navigate)
    }
}
