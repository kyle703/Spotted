//
//  Modal.swift
//  Spotted
//
//  Created by Kyle Thompson on 12/28/20.
//  Copyright © 2020 Kyle Thompson. All rights reserved.
//

import SwiftUI

class NumbersOnly: ObservableObject {
    @Published var value = "" {
        didSet {
            let filtered = value.filter { $0.isNumber }
            
            if value != filtered {
                value = filtered
            }
        }
    }
}

struct SpotModal: View {
    
    var selectedPlayer: Player?
    var onComplete: (_ num: Int32) -> Void
    @State var input: Int32 = 0

    var body: some View {
        VStack {
            Spacer()
            Text(selectedPlayer?.firstName ?? "N/A")
                .font(.title)
                .padding()
            Text("spotted")
            Spacer()
            CircleSlider(displayValue: $input)
            Spacer()
            ConfirmButton(title: "Confirm", action: { onComplete(input) })
        }
    }
}

struct ConfirmButton: View {
    let title: String
    let action: () -> Void

    var body: some View {
        Button(title, action: action)
            .foregroundColor(.white)
            .padding()
            .background(Color.secondaryGreen)
            .cornerRadius(8)
    }
}
