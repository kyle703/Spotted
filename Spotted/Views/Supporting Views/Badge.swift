//
//  Badge.swift
//  Spotted
//
//  Created by Kyle Thompson on 3/17/21.
//  Copyright © 2021 Kyle Thompson. All rights reserved.
//

import SwiftUI

struct Badge: View {
    let position: Int
    var color: Color {
        switch position {
        case 1:
            return Color.yellow
        case 2:
            return Color.gray
        default:
            return Color.blue
        }
    }
    var body: some View {
        ZStack {
            Circle()
                .frame(width: 32.0, height: 32.0)
                .foregroundColor(color)
            Text("\(position)")
                .font(.callout)
                .bold()
                .foregroundColor(.white)
        }
    }
}

struct Badge_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            Badge(position: 1)
            Badge(position: 2)
            Badge(position: 3)
        }.previewLayout(.sizeThatFits)
    }
}
