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
        HStack {
            VStack(alignment: .leading) {
                Text(task.title)
                    .font(.headline)
                    .foregroundColor(Color(.label)) // System color
                    .lineLimit(1)
                    .accessibilityLabel("Task title: \(task.title)")
                Text(task.dueDate.formatted())
                    .font(.subheadline)
                    .foregroundColor(Color(.secondaryLabel)) // System color
                    .lineLimit(1)
                    .accessibilityLabel("Due date: \(String(describing: task.dueDate.formatted()))")
            }
            Spacer()
            Image(systemName: task.isCompleted ? "checkmark.circle.fill" : "circle")
                .foregroundColor(task.isCompleted ? Color(.systemGreen) : Color(.systemGray)) // System color
                .accessibilityLabel(task.isCompleted ? "Completed" : "Pending")
        }
    }
}