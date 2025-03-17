//
//  SettingsView.swift
//  TaskManagerDemo
//
//  Created by Hakim Bohra on 3/17/25.
//

import SwiftUI

struct SettingsView: View {
    @ObservedObject var viewModel: TaskViewModel  // Reference to the TaskViewModel
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("Accent Color")) {
                    Picker("Accent Color", selection: $viewModel.accentColor) {
                        ForEach(AccentColor.colors, id: \.self) { color in
                            HStack {
                                Text(color.name)
                                    .accessibilityLabel("\(color.name)")
                                Spacer()
                                Circle()
                                    .fill(color.color)
                                    .frame(width: 20, height: 20)
                            }
                            .tag(color)
                        }
                    }
                    .pickerStyle(WheelPickerStyle())  // Use a wheel style picker
                    .accessibilityElement(children: .combine) // Combines picker items into one element
                    .accessibilityLabel("Accent Color Selection Picker") // Label for the picker itself
                    .accessibilityHint("Swipe up or down to change color.")
                }
            }
            .navigationTitle("Settings")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        presentationMode.wrappedValue.dismiss()
                    }
                }
            }
        }
        .tint(viewModel.accentColor.color)
    }
}
