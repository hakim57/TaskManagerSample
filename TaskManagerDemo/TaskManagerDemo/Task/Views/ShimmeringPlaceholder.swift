//
//  ShimmeringPlaceholder.swift
//  TaskManagerDemo
//
//  Created by Hakim Bohra on 3/17/25.
//


import SwiftUI

struct ShimmeringPlaceholder: View {
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 0) {
                ForEach(0..<10, id: \.self) { index in
                    ShimmerRowView()
                        .padding(.vertical, 8)
                        .padding(.horizontal, 16)
                        .background(Color(.systemBackground))
                        .cornerRadius(8)
                        .shadow(color: Color.black.opacity(0.1), radius: 2, x: 0, y: 1)
                        .padding(.vertical, 4)
                        .accessibilityElement(children: .ignore)
                        .accessibilityLabel("Loading task \(index + 1)")
                        .accessibilityHint("Placeholder while content is loading")
                }
            }
            .padding(.vertical, 8)
        }
        .background(Color(.systemGroupedBackground))
        .accessibilityLabel("Loading tasks")
    }
}