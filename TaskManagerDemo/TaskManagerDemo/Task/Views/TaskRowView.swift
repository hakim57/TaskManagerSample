//
//  TaskRowView.swift
//  TaskManagerDemo
//
//  Created by Hakim Bohra on 3/17/25.
//


import SwiftUI

struct TaskRowView: View {
    @ObservedObject var task: TaskItem
    @ObservedObject var viewModel: TaskViewModel
    var onTap: () -> Void
    var onDelete: () -> Void
    var onComplete: () -> Void
    
    var body: some View {
        NavigationLink(destination: TaskDetailView(task: task, viewModel: viewModel)) {
            TaskContentView(task: task)
                .padding(.vertical, 8)
                .padding(.horizontal, 16)
                .background(Color(.systemBackground)) // System color
                .cornerRadius(8)
                .shadow(color: Color.black.opacity(0.1), radius: 2, x: 0, y: 1)
                .padding(.vertical, 4)
        }
        .buttonStyle(PlainButtonStyle()) // Remove default button styling
        .swipeActions(edge: .trailing, allowsFullSwipe: true) {
            // Swipe to delete
            Button(role: .destructive, action: onDelete) {
                Label("Delete", systemImage: "trash")
            }
            .accessibilityLabel("Delete task")
            .accessibilityHint("Swipe to delete this task")
        }
        .swipeActions(edge: .leading, allowsFullSwipe: true) {
            // Swipe to complete
            Button(action: onComplete) {
                Label(task.isCompleted ? "Undo" : "Complete", systemImage: task.isCompleted ? "arrow.uturn.backward" : "checkmark")
            }
            .tint(task.isCompleted ? Color.orange : Color.green)
            .accessibilityLabel(task.isCompleted ? "Mark as Pending" : "Mark as Completed")
            .accessibilityHint("Swipe to toggle task completion status")
        }
        .accessibilityElement(children: .combine)
        .accessibilityLabel("\(task.title), due \(String(describing: task.dueDate.formatted()))")
        .accessibilityHint(task.isCompleted ? "Completed" : "Pending")
        .transition(.opacity.combined(with: .scale)) // Fade and scale transition
        .onDrag {
            // Provide the task as the drag item
            return NSItemProvider(object: task.id?.uuidString as NSString? ?? NSString())
        }
    }
}