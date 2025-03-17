//
//  CircularProgressRing.swift
//  TaskManagerDemo
//
//  Created by Hakim Bohra on 3/17/25.
//


import SwiftUI

struct CircularProgressRing: View {
    var progress: Double // Progress value between 0 and 1
    var lineWidth: CGFloat = 10
    var color: Color

    var body: some View {
        ZStack {
            // Background ring
            Circle()
                .stroke(lineWidth: lineWidth)
                .opacity(0.3)
                .foregroundColor(color)
            // Progress ring
            Circle()
                .trim(from: 0, to: CGFloat(progress))
                .stroke(style: StrokeStyle(lineWidth: lineWidth, lineCap: .round, lineJoin: .round))
                .foregroundColor(color)
                .rotationEffect(.degrees(-90)) // Start from the top
                .animation(.easeOut(duration: 0.5), value: progress)
        }
        .padding(lineWidth / 2)
    }
}