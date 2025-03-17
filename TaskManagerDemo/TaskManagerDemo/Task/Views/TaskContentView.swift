//
//  TaskContentView.swift
//  TaskManagerDemo
//
//  Created by Hakim Bohra on 3/17/25.
//


import SwiftUI

struct TaskContentView: View {
    @ObservedObject var task: TaskItem
    
    var body: some View {
        HStack(alignment: .top) {
            // Priority Indicator (Dot)
            Circle()
                .fill(priorityColor(task.priority))
                .frame(width: 12, height: 12)
                .padding(.top, 10)
                .padding(.leading, 5)
                .accessibilityLabel("Task priority: \(task.priority)")
            
            // Task Content
            VStack(alignment: .leading, spacing: 6) {
                // Task Title
                Text(task.title)
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundColor(.primary)
                    .lineLimit(1)
                    .accessibilityLabel("Task title: \(task.title)")
                
                // Task Description or Due Date
                Text(task.dueDate.formatted(date: .abbreviated, time: .shortened))
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .accessibilityLabel("Due date: \(String(describing: task.dueDate.formatted()))")
                
                // Optional tags or labels (e.g., Completed, High Priority)
                if task.isCompleted {
                    Text("Completed")
                        .font(.caption)
                        .foregroundColor(.green)
                        .padding(4)
                        .background(Capsule().fill(Color.green.opacity(0.2)))
                        .accessibilityLabel("Task Completed")
                } else if task.priority == "High" {
                    Text("High Priority")
                        .font(.caption)
                        .foregroundColor(.red)
                        .padding(4)
                        .background(Capsule().fill(Color.red.opacity(0.2)))
                        .accessibilityLabel("Task Pending")
                }
            }
            .padding(8)
            Spacer()
        }
        .background(
            RoundedRectangle(cornerRadius: 15)
                .fill(Color(.systemBackground))
                .shadow(color: Color.black.opacity(0.1), radius: 4, x: 0, y: 2)
        )
        .padding(.vertical, 8)
        .padding(.horizontal, 16)
    }
    
    // Helper function for priority color
    private func priorityColor(_ priority: String?) -> Color {
        switch priority {
        case "High":
            return .red
        case "Medium":
            return .yellow
        case "Low":
            return .blue
        default:
            return .gray
        }
    }
}
