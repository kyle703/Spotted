//
//  ActionButton.swift
//  Spotted
//
//  Created by Kyle Thompson on 10/17/20.
//  Copyright © 2020 Kyle Thompson. All rights reserved.
//

import SwiftUI

struct ActionButton: View {
    
    var gradient:  LinearGradient
    var label: String
    var action: () -> Void;
    
    @State var selected = false
    
    var body: some View {
        Button(action: buttonAction)
        {
            Text(label)
        }
        .actionButtonStyle(gradient: gradient, selected: selected)
    }
    
    func buttonAction() {
        self.selected.toggle()
        // other things
        action()
    }
}

extension View {

    func actionButtonStyle(gradient: LinearGradient, selected: Bool) -> some View {
        self
        .frame(minWidth: 0, maxWidth: .infinity)
        .font(Font.system(size: 20).weight(.semibold))
        .padding()
        .padding(.horizontal, 20)
        .background(gradient)
        .cornerRadius(40)
        .shadow(color: .gray, radius: 20.0, x: 20, y: 10)
        .foregroundColor(Color.white)
        .scaleEffect(selected ? 0.9 : 1.0)
    }
}

struct ActionButton_Previews: PreviewProvider {
    static var gradient = LinearGradient(gradient: Gradient(colors: [.blue, .white, .red]), startPoint: .leading, endPoint: .trailing)
    static func action() {
        print("just a test bro!!")
    }

    static var previews: some View {
        ActionButton(gradient: gradient, label: "test", action: self.action)
    }
}
