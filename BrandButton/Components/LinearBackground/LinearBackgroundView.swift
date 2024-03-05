//
//  LinearBackground.swift
//  BrandButton
//
//  Created by Volodymyr Mendyk on 01/03/2024.
//

import SwiftUI

struct LinearBackgroundView: View {

    let enableAnimation: Bool
    let duration: TimeInterval
    var gradient = [
        Color(hex: "#AA2FBE"),
        Color(hex: "#2540D9"),
        Color(hex: "#12E55A")
    ]

    @State var startPoint = UnitPoint(x: 0, y: 0)
    @State var endPoint = UnitPoint(x: 0, y: 2)


    init(enableAnimation: Bool = true, duration: TimeInterval = 4) {
        self.enableAnimation = enableAnimation
        self.duration = duration
    }

    var body: some View {
            ZStack {
                LinearGradient(gradient: Gradient(colors: self.gradient), startPoint: self.startPoint, endPoint: self.endPoint)
            }
            .edgesIgnoringSafeArea(.vertical)
            .onAppear {
                guard enableAnimation == true else { return }
                withAnimation(Animation.easeInOut(duration: duration).repeatForever(autoreverses: true)) {
                    self.startPoint = UnitPoint(x: 1, y: -1)
                    self.endPoint = UnitPoint(x: 0, y: 1)
                    self.startPoint = UnitPoint(x: 1, y: -2)
                }
            }
    }
}
