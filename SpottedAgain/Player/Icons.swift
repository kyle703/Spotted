//
//  Icons.swift
//  SpottedAgain
//
//  Created by Kyle Thompson on 11/5/21.
//

import SwiftUI

struct PlayerIcon: View {
    var imageName: String;
    var bgColor: Color;
    
    var body: some View {
        Image(imageName)
            .resizable()
            .scaledToFit()
            .padding(5)
            .background(bgColor)
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.primaryWhite, lineWidth: 4))
            .shadow(radius: 10)
    }
}

struct IconButton: View {
    var id: Int;
    var imageName: String = "Bmo"
    var color: Color = Color.primaryBlue
    var onTap: (_ id: Int) -> Void;
    var body: some View {
        
        Button(action: {
            onTap(id)
        }) {
            PlayerIcon(imageName: imageName, bgColor: color)
        }
        .frame(width: 75, height: 75, alignment: .center)
    }
}

struct Icons {
    public static let iconNames = ["BabyYoda", "Bmo", "CookieMonster", "FSociety", "Genie", "Nibbler", "Stormtrooper", "Totoro"];
}

struct StealIcon: View {
    var width: CGFloat = 55.0
    var body: some View {
        ActionIcon(color: Color.secondaryRed, imageName: "Beaver", width: width)
    }
}

struct AddIcon: View {
    var width: CGFloat = 55.0
    var body: some View {
        ActionIcon(color: Color.secondaryGreen, imageName: "Cow", width: width)
    }
}

struct PlayerIcon_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            PlayerIcon(imageName: "Bmo", bgColor: .blue).frame(width: 400, height: 400)
            IconButton(id: 1, onTap: {(num: Int) -> Void in print(num);})
        }
    }
}

