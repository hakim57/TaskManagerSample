//
//  CircularProgressRing.swift
//  TaskManagerDemo
//
//  Created by Hakim Bohra on 3/17/25.
//


import SwiftUI

struct CircularProgressRing: View {
    var progress: Double
    var lineWidth: CGFloat = 15
    var color: Color = .blue

    var body: some View {
        ZStack {
            Circle()
                .stroke(lineWidth: lineWidth)
                .opacity(0.3)
                .foregroundColor(color)

            Circle()
                .trim(from: 0.0, to: progress)
                .stroke(style: StrokeStyle(lineWidth: lineWidth, lineCap: .round, lineJoin: .round))
                .foregroundColor(color)
                .rotationEffect(Angle(degrees: -90))
                .animation(.easeInOut, value: progress)

            Text("\(Int(progress * 100))%")
                .font(.title3)
                .fontWeight(.bold)
                .foregroundColor(.primary)
        }
    }
}
