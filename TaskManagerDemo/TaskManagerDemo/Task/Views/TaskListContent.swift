//
//  TaskListContent.swift
//  TaskManagerDemo
//
//  Created by Hakim Bohra on 3/17/25.
//

import SwiftUI

struct TaskListContent: View {
    @ObservedObject var viewModel: TaskViewModel
    @State private var lastDeletedTask: TaskItem? = nil
    @State private var lastCompletedTask: TaskItem? = nil
    @State private var showSnackbar = false
    
    var body: some View {
        ZStack(alignment: .bottom) {
            if viewModel.tasks.isEmpty {
                EmptyStateView(tint: .blue)
            } else {
                ScrollView {
                    LazyVStack(spacing: 16){
                        ForEach(viewModel.tasks, id: \.id) { task in
                            TaskRowView(task: task, viewModel: viewModel, onTap: {
                                // No action needed here since NavigationLink handles navigation
                            }, onDelete: {
                                withAnimation(.easeInOut) {
                                    lastDeletedTask = task
                                    viewModel.deleteTask(task)
                                    showSnackbar = true
                                }
                            }, onComplete: {
                                withAnimation(.easeInOut) {
                                    lastCompletedTask = task
                                    viewModel.toggleTaskCompletion(task)
                                    showSnackbar = true
                                }
                            })
                        }
                        .onMove { source, destination in
                            withAnimation(.easeInOut) {
                                viewModel.moveTask(from: source, to: destination)
                                // Trigger haptic feedback
                                let generator = UIImpactFeedbackGenerator(style: .medium)
                                generator.impactOccurred()
                            }
                        }
                    }
                    .padding(.horizontal)
                }
                .background(LinearGradient(gradient: Gradient(colors: [.white, .blue.opacity(0.1)]), startPoint: .top, endPoint: .bottom))
                .accessibilityLabel("Task list")
            }
            
            if showSnackbar {
                Snackbar(
                    message: lastDeletedTask != nil ? "Task deleted" : "Task marked as completed",
                    actionText: "Undo",
                    action: {
                        withAnimation(.easeInOut) {
                            if let task = lastDeletedTask {
                                viewModel.undoDelete(task)
                            } else if let task = lastCompletedTask {
                                viewModel.toggleTaskCompletion(task)
                            }
                            showSnackbar = false
                            lastDeletedTask = nil
                            lastCompletedTask = nil
                        }
                    }
                )
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                        withAnimation {
                            showSnackbar = false
                            lastDeletedTask = nil
                            lastCompletedTask = nil
                        }
                    }
                }
            }
        }
    }
}
