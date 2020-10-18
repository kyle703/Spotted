//
//  ActionSelector.swift
//  Spotted
//
//  Created by Kyle Thompson on 10/17/20.
//  Copyright © 2020 Kyle Thompson. All rights reserved.
//

import SwiftUI

struct ActionSelector: View {
    
    var actions: [ActionButtonModel]
    
    var body: some View {
        VStack {
//            if isAddSelected {
//                Text("Who saw the cows?")
//                    .font(.system(size: 15))
//                    .padding(5)
//            } else if isStealSelected {
//                Text("Who is stealing?")
//                    .font(.system(size: 15))
//                    .padding(5)
//            }
            HStack {
                Spacer()
                ForEach(actions) { action in
                    ActionButton(model: action)
                    .isSelectedStyle(selected: action.isSelected)
                    Spacer()
                }
            }
        }
        
    }
    
    
}

extension View {
    func isSelectedStyle(selected: BooleanLiteralType) -> some View {
           self
           .if(selected) { view in
               view.padding(10)
               .overlay(
                   RoundedRectangle(cornerRadius: 40)
                       .stroke(Color.red, lineWidth: 5)
               )
           }
       }
}

struct ActionSelector_Previews: PreviewProvider {
    static let model = ActionButton_Previews.model
    static var actionList = [model]
    static var previews: some View {
        ActionSelector(actions: actionList)
    }
}
