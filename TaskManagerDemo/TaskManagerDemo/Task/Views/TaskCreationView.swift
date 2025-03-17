//
//  TaskCreationView.swift
//  TaskManagerDemo
//
//  Created by Hakim Bohra on 3/17/25.
//


import SwiftUI

struct TaskCreationView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var viewModel: TaskViewModel
    
    @State private var title: String = ""
    @State private var description: String = ""
    @State private var priority: TaskPriority = .medium
    @State private var dueDate: Date = Date()
    
    var body: some View {
        NavigationStack {
            Form {
                // Title (required)
                Section(header: Text("Title")) {
                    TextField("Enter task title", text: $title)
                        .accessibilityLabel("Task title")
                        .accessibilityHint("Enter the title of the task")
                        .accessibilityIdentifier("TaskTitle")
                }
                
                // Description (optional)
                Section(header: Text("Description")) {
                    TextField("Enter task description (optional)", text: $description)
                        .accessibilityLabel("Task description")
                        .accessibilityHint("Enter an optional description for the task")
                        .accessibilityIdentifier("TaskDescription")
                }
                
                // Priority (Low, Medium, High)
                Section(header: Text("Priority")) {
                    Picker("Priority", selection: $priority) {
                        ForEach(TaskPriority.allCases, id: \.self) { priority in
                            Text(priority.rawValue).tag(priority)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .accessibilityLabel("Task priority")
                    .accessibilityIdentifier("TaskPriority")
                    .accessibilityHint("Select the priority of the task")
                }
                
                // Due Date (via date picker)
                Section(header: Text("Due Date")) {
                    DatePicker("Select due date", selection: $dueDate, displayedComponents: .date)
                        .datePickerStyle(GraphicalDatePickerStyle())
                        .accessibilityLabel("Task due date")
                        .accessibilityIdentifier("TaskDueDate")
                        .accessibilityHint("Select the due date for the task")
                }
            }
            .navigationTitle("New Task")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        presentationMode.wrappedValue.dismiss()
                    }
                    .accessibilityLabel("Cancel")
                    .accessibilityHint("Dismiss the task creation screen without saving")
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Save") {
                        saveTask()
                        presentationMode.wrappedValue.dismiss()
                    }
                    .disabled(title.isEmpty)
                    .accessibilityLabel("Save task")
                    .accessibilityIdentifier("SaveTask")
                    .accessibilityHint(title.isEmpty ? "Save button is disabled because the title is empty" : "Save the task and dismiss the screen")
                }
            }
            .tint(viewModel.accentColor.color) // Apply accent color
        }
    }
    
    private func saveTask() {
        let newTask = TaskItem(context: viewModel.context)
        newTask.id = UUID()
        newTask.title = title
        newTask.taskDesc = description.isEmpty ? nil : description
        newTask.priority = priority.rawValue
        newTask.dueDate = dueDate
        newTask.isCompleted = false
        
        viewModel.saveContext()
    }
}
