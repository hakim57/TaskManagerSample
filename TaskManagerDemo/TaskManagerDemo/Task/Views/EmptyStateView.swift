//
//  EmptyStateView.swift
//  TaskManagerDemo
//
//  Created by Hakim Bohra on 3/17/25.
//


import SwiftUI

struct EmptyStateView: View {
    var tint: Color  // Dynamic accent color
    var body: some View {
        VStack(spacing: 16) {
            Image(systemName: "checkmark.circle.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 80, height: 80)
                .foregroundColor(tint)
                .opacity(0.8)

            Text("No Tasks Yet")
                .font(.title2)
                .bold()
                .foregroundColor(.primary)

            Text("You're all caught up! Take a moment to relax or add a new task to get started.")
                .font(.subheadline)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 24)
        }
        .padding()
        .accessibilityElement(children: .combine)
        .accessibilityLabel("No tasks yet. You're all caught up! Add a new task to get started.")
    }
}