//
//  ActionButton.swift
//  SpottedAgain
//
//  Created by Kyle Thompson on 10/24/21.
//

import SwiftUI

struct ActionButton: View {
    @Binding var activeSheet: ActiveSheet?
    @State var isOpen: Bool = false
    
    
    var body: some View {
        let mainButton = MainButton(imageName: "plus", isOpen: isOpen)
        
        let addOnTap = {
            activeSheet = .addPoints;
            isOpen = false;
        }
        
        let stealOnTap = {
            activeSheet = .stealPoints;
            isOpen = false;
        }
        
        
        let stealButton = SubmenuButton(buttonView: MenuItem(imageName: "Beaver", color: Color.secondaryRed), action: stealOnTap)
        
        
        let addButton = SubmenuButton(buttonView: MenuItem(imageName: "Cow", color: Color.secondaryGreen), action: addOnTap)
        
        
        
        return FloatingButton(mainButtonView: mainButton, buttons: [addButton, stealButton], isOpen: $isOpen)
            .circle()
            .startAngle(3/2 * .pi)
            .endAngle(.pi)
            .radius(85)
            .delays(delayDelta: 0.1)
    }
}

struct MenuItem: View {
    
    var imageName: String
    var color: Color = Color.secondaryBlue
    let imageWidth: CGFloat = 75
    let buttonWidth: CGFloat = 75
    
    var body: some View {
        ZStack {
            color
            Image(imageName)
                .imageScale(.large)
                .frame(width: imageWidth, height: imageWidth)
                .foregroundColor(.white)
        }
        .frame(width: buttonWidth, height: buttonWidth)
        .cornerRadius(buttonWidth / 2)
        .shadow(color: .gray, radius: 0.2, x: 1, y: 1)
    }
}

struct MainButton: View {
    
    var imageName: String
    var width: CGFloat = 80
    var isOpen = false;
    
    private var color: Color { isOpen ? Color.gray : Color.primaryGreen }
    
    var body: some View {
        ZStack {
            color
                .frame(width: width, height: width)
                .cornerRadius(width / 2)
                .shadow(color: Color.gray.opacity(0.3), radius: 15, x: 0, y: 15)
            Image(systemName: imageName)
                .font(.system(size: 42))
                .foregroundColor(.white)
                .rotationEffect(.degrees(isOpen ? 45 : 0))
                .animation(.easeIn)
        }
    }
}

struct ActionButton_Previews: PreviewProvider {
    static var previews: some View {
        ActionButton(activeSheet: .constant(nil))
    }
}
