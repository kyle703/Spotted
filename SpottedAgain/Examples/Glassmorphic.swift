//
//  Glassmorphic.swift
//  SpottedAgain
//
//  Created by Kyle Thompson on 9/18/21.
//

import SwiftUI


struct Glassmorphic: View {
    @State private var activeSheet: ActiveSheet?
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.7521633032, green: 1, blue: 0.9844500755, alpha: 1)), Color(#colorLiteral(red: 0.4770092861, green: 0.9190720105, blue: 1, alpha: 1)).opacity(0.0)]), startPoint: .top, endPoint: .bottom)
                
            
            LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.1216229446, green: 0.3541779848, blue: 0.7033001615, alpha: 1)).opacity(0.6), Color(#colorLiteral(red: 0.01125960331, green: 0.9895388484, blue: 0.5955243707, alpha: 1)).opacity(0.2)]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
            
            ZStack {
                Circle()
                    .frame(width: 400, height: 400, alignment: .center)
                    .offset(x: 150, y:-200)
                    .foregroundColor(Color(#colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)).opacity(0.4))
                    .blur(radius: 6)
                Circle()
                    .frame(width: 300, height: 300, alignment: .center)
                    .offset(x: -120, y:-100)
                    .foregroundColor(Color(#colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)).opacity(0.3))
                    .blur(radius: 8)
                VStack {
                    
                    GameView(activeSheet: $activeSheet)
                }
                .padding()
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
}


struct Gassmorphic_Previews: PreviewProvider {
    static var previews: some View {
        Glassmorphic()
    }
}


struct CardView: View {
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

struct NavItem: Identifiable {
    var name: String;
    var icon: String;
    var action: ();
    var id: String { name }
}



struct GlassButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .padding(20)
            .font(.system(size: 20))
            .background(
                Group {
                    if configuration.isPressed {
                        Circle()
                            .fill( Color.white.opacity(0.6))
                    } else {
                        Circle()
                            .fill(Color.white.opacity(0.8))
                            .shadow(color: Color.black.opacity(0.2), radius: 10, x: 10, y: 10)
                    }
                }
            )
    }
}




