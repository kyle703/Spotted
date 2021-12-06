//
//  ActionRow.swift
//  SpottedAgain
//
//  Created by Kyle Thompson on 11/12/21.
//

import SwiftUI

struct ActionIcon: View {
    
    var color: Color = .blue
    var imageName: String = "Cow"
    var width: CGFloat = 55.0;
    
    var body: some View {
        ZStack {
            color
            Image(imageName)
                .frame(width: width, height: width)
                .foregroundColor(.white)
        }
        .frame(width: width, height: width)
        .cornerRadius(width / 2)
    }
}

struct ActionRow: View {
    var action: Action = Action.sampleActions[0]
    
    var body: some View {
        containedView()
    }
    
    func containedView() -> AnyView {
        switch action.type {
            case .add:
                return AnyView(AddActionRow(action: action))
            case .penalty:
                return AnyView(AddActionRow(action: action))
            case .steal:
                return AnyView(StealActionRow(action: action))
        }
      }
}

struct StealActionRow: View {
    var action = Action.sampleActions[4]

    var body: some View {
        HStack {
            StealIcon()
            VStack(alignment: .leading, spacing: 10) {
                Text("\(action.playerTo.name) ").bold() +
                Text("stole ") +
                    Text("\(action.amount) ").bold() +
                    Text("cows from ") +
                    Text("\(action.playerFrom!.name)").bold()
                
                TimeText(date: action.date)
            }
            
            Spacer()
        }.frame(maxWidth: .infinity).padding()
    }
}

struct AddActionRow: View {
    var action = Action.sampleActions[0]
    let addIcon = ActionIcon(color: Color.secondaryGreen, imageName: "Cow")
    
    var body: some View {
        HStack {
            addIcon
            VStack(alignment: .leading, spacing: 10) {
                Text("\(action.playerTo.name) ").bold() +
                Text("spotted ") +
                Text("\(action.amount)").bold() +
                Text(" cows")
                
                
                TimeText(date: action.date)
            }
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .padding()
    }
}

struct TimeText: View {
    
    var date: Date
    @State var displayText: String?
    
    let timer = Timer.publish(
            every: 1, // second
            on: .main,
            in: .common
        ).autoconnect()
    
    
    var body: some View {
        Text(displayText ?? date.getRelativeFormat()).foregroundColor(.primaryGrey).onReceive(timer) { (_) in
            self.displayText = date.getRelativeFormat()
        }
    }
}



struct ActionRow_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            AddActionRow()
            StealActionRow()
        }
    }
}
