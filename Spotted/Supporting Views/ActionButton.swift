//
//  ActionButton.swift
//  Spotted
//
//  Created by Kyle Thompson on 10/17/20.
//  Copyright © 2020 Kyle Thompson. All rights reserved.
//

import SwiftUI

struct ActionButton: View {
    
    var gradient: LinearGradient
    var isSelected: Bool
    var text: String
    var action: () -> Void
     
    var body: some View {
        Button(action: action)
        {
            Text(text)
            .actionButtonStyle(gradient: gradient)
            .isSelectedStyle(selected: isSelected)
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

    func actionButtonStyle(gradient: LinearGradient) -> some View {
        self
        .frame(minWidth: 0, maxWidth: .infinity)
        .font(Font.system(size: 20).weight(.semibold))
        .padding()
        .padding(.horizontal, 20)
        .background(gradient)
        .cornerRadius(40)
        .shadow(color: .gray, radius: 20.0, x: 20, y: 10)
        .foregroundColor(Color.white)
    }
}

struct ActionButton_Previews: PreviewProvider {
    static var gradient = LinearGradient(gradient: Gradient(colors: [.blue, .white, .red]), startPoint: .leading, endPoint: .trailing)
    static func action() {
        print("just a test bro!!")
    }
    
    static var previews: some View {
        ActionButton(gradient: gradient, isSelected:true, text:"action button", action: action)
    }
}
