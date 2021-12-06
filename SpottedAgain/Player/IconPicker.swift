//
//  IconPicker.swift
//  SpottedAgain
//
//  Created by Kyle Thompson on 11/5/21.
//

import SwiftUI


struct IconPicker: View {
    private let twoRowGrid = [GridItem(.flexible()), GridItem(.flexible())]
    
    var onTap: (Int) -> Void;
    
    var body: some View {
        LazyHGrid(rows: twoRowGrid) {
            ForEach((0..<Icons.iconNames.count), id: \.self) {
                IconButton(id: $0, imageName: Icons.iconNames[$0], onTap: onTap)
                    .buttonStyle(BorderlessButtonStyle()) // This fixes triggering all buttons recieve a tapGesture in a form https://www.hackingwithswift.com/forums/swiftui/buttons-in-a-form-section/6175
            }
        }
    }
}




struct IconPicker_Previews: PreviewProvider {
    static var previews: some View {
        IconPicker(onTap: {(num: Int) -> Void in print(num);}).frame(height: 200)
    }
}
