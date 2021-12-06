//
//  GameCard.swift
//  SpottedAgain
//
//  Created by Kyle Thompson on 10/24/21.
//

import SwiftUI

struct GameCard: View {
    var body: some View {
        ZStack {
            Color.white.opacity(0.5)
                .frame(width: 400, height: 100, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
                .shadow(color: Color.black.opacity(0.1), radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/)
                .blur(radius: 1)
            
            HStack (spacing: 10) {
                
                Circle()
                    .frame(width: 60, height: 60, alignment: .center)
                    .foregroundColor(Color.white)
                    
                VStack(alignment: .leading, spacing: 10) {
                    Text("Glassmorphism")
                        .font(.system(size: 24, weight: .bold, design: .rounded))
                    Text("20,100 🐄")
                        .font(.system(size: 32, weight: .light, design: .rounded))
                }
            }
            .padding(.horizontal)
            .frame(width: 400, height: 100, alignment: .leading)
            
        }
        .foregroundColor(Color.black.opacity(0.8))
    }
}

struct GameCard_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black
            GameCard()
        }
    }
}
