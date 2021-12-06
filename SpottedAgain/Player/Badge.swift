//
//  Badge.swift
//  SpottedAgain
//
//  Created by Kyle Thompson on 11/28/21.
//

import SwiftUI

struct Badge: View {
    let count: Int
    var bgColor: MedalGradient {
        switch count {
        case 1:
            return MedalGradient(colors: [Color.primaryGold, Color.secondaryGold]);
        case 2:
            return MedalGradient(colors: [Color.primarySilver, Color.secondarySilver]);
        case 3:
            return MedalGradient(colors: [Color.primaryBronze, Color.secondaryBronze])
        default:
            return MedalGradient(colors: [Color.primaryBlue]);
        }
    }
    let textColor: Color = .white

    var body: some View {
        ZStack(alignment: .topLeading) {
            Color.clear
            Text(String(count))
                .bold()
                .padding(15)
                .background(bgColor)
                .foregroundColor(.white)
                .clipShape(Circle())
                
                // custom positioning in the top-left corner
                .alignmentGuide(.top) { $0[.top] + $0.height - $0.height * 0.5 }
                .alignmentGuide(.leading) { $0[.leading] + $0.width * 0.25 }
        }
    }
}

struct Badge_Previews: PreviewProvider {
    static var previews: some View {
        HStack{
            Badge(count: 1)
            Badge(count: 2)
            Badge(count: 3).font(.system(size: 32))
        }.padding()
    }
}
