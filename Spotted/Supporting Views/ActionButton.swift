//
//  ActionButton.swift
//  Spotted
//
//  Created by Kyle Thompson on 10/17/20.
//  Copyright © 2020 Kyle Thompson. All rights reserved.
//

import SwiftUI

struct ActionButton: View {
    
    var model: ActionButtonModel
     
    var body: some View {
        Button(action: model.action)
        {
            Text(model.text)
                .actionButtonStyle(gradient: model.gradient)
        }
    }
}

extension View {

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
    static let model = ActionButtonModel(id: 0, gradient: gradient, isSelected: true, text: "HELLO", action: action)

    static var previews: some View {
        ActionButton(model: model)
    }
}
