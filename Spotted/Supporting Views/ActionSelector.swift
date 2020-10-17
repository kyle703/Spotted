//
//  ActionSelector.swift
//  Spotted
//
//  Created by Kyle Thompson on 10/17/20.
//  Copyright © 2020 Kyle Thompson. All rights reserved.
//

import SwiftUI

struct ActionSelector: View {
    
    let addButtonGradient = LinearGradient(gradient: Gradient(colors: [Color("Navy"), Color("GreenYellow")]), startPoint: .leading, endPoint: .trailing)
    
    let stealButtonGradient = LinearGradient(gradient: Gradient(colors: [Color("HotRed"), Color("DarkPurple")]), startPoint: .leading, endPoint: .trailing)
    

    @State private var isAddSelected = false
    @State private var isStealSelected = false
    
    var body: some View {
        VStack {
            if isAddSelected {
                Text("Who saw the cows?")
                    .font(.system(size: 15))
                    .padding(5)
            } else if isStealSelected {
                Text("Who is stealing?")
                    .font(.system(size: 15))
                    .padding(5)
            }
            HStack {
                Spacer()
                ActionButton(gradient: addButtonGradient, isSelected: isAddSelected, text: "Add", action: addButtonTapped)
                Spacer()
                ActionButton(gradient: stealButtonGradient, isSelected: isStealSelected, text: "🐴Steal", action: stealButtonTapped)
                Spacer()
            }
        }
        
    }
    
    func addButtonTapped() {
        print("add")
        if isAddSelected {
            isAddSelected = false
        } else {
            isAddSelected = true
            isStealSelected = false
        }
    }
    
    func stealButtonTapped() {
        print("steal")
        if isStealSelected {
            isStealSelected = false
        } else {
            isStealSelected = true
            isAddSelected = false
        }
    }
}

struct ActionSelector_Previews: PreviewProvider {
    static var previews: some View {
        ActionSelector()
    }
}
