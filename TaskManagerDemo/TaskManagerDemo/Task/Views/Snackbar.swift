//
//  Snackbar.swift
//  TaskManagerDemo
//
//  Created by Hakim Bohra on 3/17/25.
//


import SwiftUI

struct Snackbar: View {
    var message: String
    var actionText: String
    var action: () -> Void

    var body: some View {
        HStack {
            Text(message)
                .font(.subheadline)
                .foregroundColor(.white)
            Spacer()
            Button(action: action) {
                Text(actionText)
                    .font(.subheadline)
                    .bold()
                    .foregroundColor(.white)
            }
        }
        .padding()
        .background(Color(.systemGray))
        .cornerRadius(8)
        .shadow(color: Color.black.opacity(0.1), radius: 2, x: 0, y: 1)
        .padding(.horizontal, 16)
        .padding(.bottom, 8)
        .transition(.move(edge: .bottom))
        .animation(.easeInOut, value: message)
    }
}
