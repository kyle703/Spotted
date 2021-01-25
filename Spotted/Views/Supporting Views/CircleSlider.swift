//
//  CircleSlider.swift
//  Spotted
//
//  Created by Kyle Thompson on 12/29/20.
//  Copyright © 2020 Kyle Thompson. All rights reserved.
//

import SwiftUI

struct CircleSliderPreview: View {
    @State var value: Int32 = 0

    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color.init(red: 34/255, green: 30/255, blue: 47/255))
                .edgesIgnoringSafeArea(.all)
            
            CircleSlider(displayValue: $value)
        }
    }
}

struct CircleSlider: View {
    @Binding var displayValue: Int32;
    @State var sliderValue: CGFloat = 0.0
    @State var angleValue: CGFloat = 0.0
    let config = Config(minimumValue: 0.0,
                        maximumValue: 15.0,
                        totalValue: 15.0,
                        knobRadius: 15.0,
                        radius: 125.0)
    var body: some View {
        ZStack {
            Circle()
                .frame(width: config.radius * 2, height: config.radius * 2)
                .scaleEffect(1.2)
            
            Circle()
                .stroke(Color.gray,
                        style: StrokeStyle(lineWidth: 3, lineCap: .butt, dash: [3, 23.18]))
                .frame(width: config.radius * 2, height: config.radius * 2)
            
            Circle()
                .trim(from: 0.0, to: sliderValue/config.totalValue)
                .stroke(sliderValue < config.maximumValue/2 ? Color.blue : Color.red, lineWidth: 4)
                .frame(width: config.radius * 2, height: config.radius * 2)
                .rotationEffect(.degrees(-90))
            
            Circle()
                .fill(sliderValue < config.maximumValue/2 ? Color.blue : Color.red)
                .frame(width: config.knobRadius * 2, height: config.knobRadius * 2)
                .padding(10)
                .offset(y: -config.radius)
                .rotationEffect(Angle.degrees(Double(angleValue)))
                .gesture(DragGesture(minimumDistance: 0.0)
                            .onChanged({ value in
                                change(location: value.location)
                            }))
            
            // Refactor into custom textfield eventually to manually input number
            // Also, add a rounding text util
            Text(displayValue.formatUsingAbbrevation())
                            .font(.system(size: 60))
                            .foregroundColor(.white)
        }
    }
    
    private func change(location: CGPoint) {
        // creating vector from location point
        let vector = CGVector(dx: location.x, dy: location.y)
        
        // geting angle in radian need to subtract the knob radius and padding from the dy and dx
        let angle = atan2(vector.dy - (config.knobRadius + 10), vector.dx - (config.knobRadius + 10)) + .pi/2.0
        
        // convert angle range from (-pi to pi) to (0 to 2pi)
        let fixedAngle = angle < 0.0 ? angle + 2.0 * .pi : angle
        // convert angle value to temperature value
        let value = fixedAngle / (2.0 * .pi) * config.totalValue
        
        if value >= config.minimumValue && value <= config.maximumValue {
            sliderValue = value
            displayValue = Int32(powf(2.0, Float(value)))
            angleValue = fixedAngle * 180 / .pi // converting to degree
        }
    }
}

struct Config {
    let minimumValue: CGFloat
    let maximumValue: CGFloat
    let totalValue: CGFloat
    let knobRadius: CGFloat
    let radius: CGFloat
}

struct CircleSlider_Previews: PreviewProvider {
    static var previews: some View {
        CircleSliderPreview()
    }
}
