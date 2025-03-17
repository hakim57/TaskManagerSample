//
//  TaskDetailView.swift
//  TaskManagerDemo
//
//  Created by Hakim Bohra on 3/17/25.
//

import SwiftUI

struct TaskDetailView: View {
    @ObservedObject var task: TaskItem
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var viewModel: TaskViewModel

    var body: some View {
        ZStack {
            // Background color gradient
            LinearGradient(gradient: Gradient(colors: [.blue.opacity(0.2), .white]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)

            VStack {
                Spacer()
                // Floating Task Details Card
                VStack(alignment: .leading, spacing: 16) {
                    // Task Title
                    Text(task.title)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.primary)
                        .lineLimit(2)
                        .padding(.bottom, 10)
                        .accessibilityLabel("Task title: \(task.title)")
                        .accessibilityHint("This is the title of your task")
                    HStack {
                        VStack(alignment: .leading) {
                            Text("Due in \(daysUntilDue(for: task.dueDate)) days")
                                .font(.headline)
                                .foregroundColor(.secondary)
                                .accessibilityLabel("Task due in \(daysUntilDue(for: task.dueDate)) days")
                            
                            Text(task.dueDate, style: .date)
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                                .accessibilityLabel("Due date: \(task.dueDate.formatted(date: .abbreviated, time: .omitted))")
                        }
                    }
                    // Task Priority
                    HStack {
                        Image(systemName: priorityIcon(for: task.priority))
                            .foregroundColor(priorityColor(for: task.priority))
                            .accessibilityHidden(true)
                        Text(task.priority)
                            .font(.headline)
                            .foregroundColor(.primary)
                            .accessibilityLabel("Task priority: \(task.priority)")
                    }

                    // Task Description
                    if let description = task.taskDesc, !description.isEmpty {
                        Text(description)
                            .font(.body)
                            .foregroundColor(.secondary)
                            .padding(.top, 10)
                            .accessibilityLabel("Task description: \(description)")
                    }
                }
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color(.systemBackground))
                        .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 4)
                )
                .padding(.horizontal)
                .accessibilityElement(children: .combine)
                .accessibilityLabel("Task details section")
                .accessibilityHint("Shows task title, due date, priority, and description")

                Spacer()

                // Sticky Action Bar
                HStack(spacing: 20) {
                    // Complete/Undo Button
                    Button(action: {
                        withAnimation(.spring()) {
                            viewModel.toggleTaskCompletion(task)
                        }
                    }) {
                        Label(task.isCompleted ? "Hold" : "Finish", systemImage: task.isCompleted ? "arrow.uturn.backward" : "checkmark")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(task.isCompleted ? Color.orange : Color.green)
                            .cornerRadius(10)
                            .shadow(color: task.isCompleted ? Color.orange.opacity(0.5) : Color.green.opacity(0.5), radius: 10, x: 0, y: 4)
                    }
                    .accessibilityLabel(task.isCompleted ? "Hold" : "Finish")
                    .accessibilityHint("Tap to toggle the completion status of the task")
                    .accessibilityAction(named: task.isCompleted ? "Mark as pending" : "Mark as completed") {
                        viewModel.toggleTaskCompletion(task)
                    }

                    // Delete Button
                    Button(role: .destructive, action: {
                        withAnimation(.spring()) {
                            viewModel.deleteTask(task)
                            presentationMode.wrappedValue.dismiss()
                        }
                    }) {
                        Label("Delete", systemImage: "trash")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.red)
                            .cornerRadius(10)
                            .shadow(color: Color.red.opacity(0.5), radius: 10, x: 0, y: 4)
                    }
                    .accessibilityLabel("Delete task")
                    .accessibilityHint("Tap to delete this task")
                    .accessibilityAction(named: "Delete task") {
                        viewModel.deleteTask(task)
                        presentationMode.wrappedValue.dismiss()
                    }
                }
                .padding(.horizontal)
                .padding(.bottom, 30)
            }
        }
        .navigationTitle("Task Details")
        .transition(.opacity.combined(with: .scale))
    }

    // Calculate days left until the due date
    private func daysUntilDue(for dueDate: Date) -> Int {
        let calendar = Calendar.current
        let startOfToday = calendar.startOfDay(for: Date())
        let startOfDueDate = calendar.startOfDay(for: dueDate)
        return calendar.dateComponents([.day], from: startOfToday, to: startOfDueDate).day ?? 0
    }

    // Helper function to get priority icon
    private func priorityIcon(for priority: String?) -> String {
        switch priority {
        case "High": return "exclamationmark.triangle.fill"
        case "Low": return "arrow.down.circle.fill"
        default: return "arrow.right.circle.fill"
        }
    }

    // Helper function to get priority color
    private func priorityColor(for priority: String?) -> Color {
        switch priority {
        case "High": return .red
        case "Low": return .blue
        default: return .orange
        }
    }
}
