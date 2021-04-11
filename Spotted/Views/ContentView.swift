//
//  ContentView.swift
//  Spotted
//
//  Created by Kyle Thompson on 10/4/20.
//  Copyright © 2020 Kyle Thompson. All rights reserved.
//
import SwiftUI

@available(iOS 14.0, *)
struct ContentView: View {
    
    @Environment(\.managedObjectContext) var managedObjectContext

    @State var isMenuShown = false
    @StateObject var viewRouter = ViewRouter()
    @StateObject var gameStorage: GameStorage
    
    var body: some View {
        ZStack {
            SideMenu(viewRouter: viewRouter, gameStorage: gameStorage)
            ZStack {
                
                Color.white.edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                VStack {
                    Spacer().frame(height: UIApplication.shared.windows.first?.safeAreaInsets.top)
                    HStack {
                        Button(action: {self.isMenuShown.toggle()}) {
                            Image(systemName: "ellipsis")
                                .padding()
                        }
                        Spacer()
                    }
                    Spacer()
                }
                ParentView(viewRouter: viewRouter)
            }
            .edgesIgnoringSafeArea(.all)
            .scaleEffect(isMenuShown ? 0.8 : 1)
            .offset(x: isMenuShown ? 200 : 0)
            .animation(.easeInOut(duration: 0.2))
            .shadow(radius: 4)
        }
    }

}

extension View {
    @ViewBuilder
    func `if`<Content: View>(_ condition: Bool, content: (Self) -> Content) -> some View {
        if condition {
            content(self)
        }
        else {
            self
        }
    }
}

struct StatefulPreviewWrapper<Value, Content: View>: View {
    @State var value: Value
    var content: (Binding<Value>) -> Content

    var body: some View {
        content($value)
    }

    init(_ value: Value, content: @escaping (Binding<Value>) -> Content) {
        self._value = State(wrappedValue: value)
        self.content = content
    }
}

