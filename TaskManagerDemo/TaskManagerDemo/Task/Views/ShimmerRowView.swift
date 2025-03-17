//
//  ShimmerRowView.swift
//  TaskManagerDemo
//
//  Created by Hakim Bohra on 3/17/25.
//


import SwiftUI

struct ShimmerRowView: View {
    @State private var isShimmering = false

    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 8) {
                // Placeholder for title
                RoundedRectangle(cornerRadius: 4)
                    .fill(Color(.systemGray5)) // Use system gray color
                    .frame(height: 16)
                    .frame(maxWidth: 200)

                // Placeholder for due date
                RoundedRectangle(cornerRadius: 4)
                    .fill(Color(.systemGray5)) // Use system gray color
                    .frame(height: 12)
                    .frame(maxWidth: 100)
            }
            Spacer()
            // Placeholder for completion icon
            Circle()
                .fill(Color(.systemGray5)) // Use system gray color
                .frame(width: 24, height: 24)
        }
        .padding(.vertical, 8)
        .background(
            LinearGradient(
                gradient: Gradient(colors: [
                    Color(.systemGray5),
                    Color(.systemGray6),
                    Color(.systemGray5)
                ]),
                startPoint: .leading,
                endPoint: .trailing
            )
            .mask(RoundedRectangle(cornerRadius: 8))
        .offset(x: isShimmering ? 200 : -200)
        .animation(
            Animation.linear(duration: 1.5)
                .repeatForever(autoreverses: false),
            value: isShimmering
        ))
        .onAppear {
            isShimmering = true
        }
        .accessibilityElement(children: .ignore)
        .accessibilityLabel("Loading task")
        .accessibilityHint("Placeholder while content is loading")
    }
}