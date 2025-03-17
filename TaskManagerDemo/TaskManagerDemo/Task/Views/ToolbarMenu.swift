//
//  ToolbarMenu.swift
//  TaskManagerDemo
//
//  Created by Hakim Bohra on 3/17/25.
//


import SwiftUI

struct ToolbarMenu: View {
    @ObservedObject var viewModel: TaskViewModel

    var body: some View {
        Menu {
            // Sorting Options
            Section("Sort By") {
                ForEach(SortOption.allCases, id: \.self) { option in
                    Button(action: {
                        viewModel.sortOption = option
                        viewModel.fetchTasks()
                    }) {
                        Text(option.rawValue)
                            .font(.body)
                        if viewModel.sortOption == option {
                            Image(systemName: "checkmark")
                                .foregroundColor(.blue)
                        }
                    }
                    .accessibilityLabel("Sort by \(option.rawValue)")
                    .accessibilityHint(viewModel.sortOption == option ? "Selected" : "Not selected")
                }
            }

            // Filtering Options
            Section("Filter By") {
                ForEach(FilterOption.allCases, id: \.self) { option in
                    Button(action: {
                        viewModel.filterOption = option
                        viewModel.fetchTasks()
                    }) {
                        Text(option.rawValue)
                            .font(.body)
                        if viewModel.filterOption == option {
                            Image(systemName: "checkmark")
                        }
                    }
                    .accessibilityLabel("Filter by \(option.rawValue)")
                    .accessibilityHint(viewModel.filterOption == option ? "Selected" : "Not selected")
                }
            }
        } label: {
            Label("Options", systemImage: "ellipsis.circle")
                .font(.body)
        }
        .accessibilityLabel("Task options menu")
        .accessibilityHint("Tap to sort or filter tasks")
    }
}
