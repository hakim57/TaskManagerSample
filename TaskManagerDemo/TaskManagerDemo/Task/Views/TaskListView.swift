//
//  TaskList.swift
//  TaskManagerDemo
//
//  Created by Hakim Bohra on 3/16/25.
//


import SwiftUI
import CoreData

struct TaskListView: View {
    @StateObject private var viewModel: TaskViewModel
    @Environment(\.managedObjectContext) private var context
    @State private var isLoading = true
    @State private var isEditing = false
    @State private var showTaskCreation = false
    @State private var isPulsing = false
    @State private var showSettings = false // Track settings view visibility
    @State private var selectedTask: TaskItem?
    
    init(context: NSManagedObjectContext) {
        _viewModel = StateObject(wrappedValue: TaskViewModel(context: context))
    }
    
    var body: some View {
        NavigationSplitView {
            Group {
                if isLoading {
                    //Add Shimmering Placeholder here
                    ShimmeringPlaceholder()
                } else {
                    VStack(spacing: 25) {
                        //1. Add Progress Ring
                        // Only show progress ring if there are tasks
                        if !viewModel.tasks.isEmpty {
                            CircularProgressRing(progress: viewModel.completionPercentage, lineWidth: 15, color: viewModel.accentColor.color)
                                .frame(width: 100, height: 100)
                                .padding(.top, 20)
                                .accessibilityLabel("Task completion progress")
                                .accessibilityHint("Shows the percentage of completed tasks")
                        }
                        //2. Add Task List
                        TaskListContent(viewModel: viewModel)
                    }
                }
            }
            .navigationTitle("Tasks")
            .background(Color(.clear))
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    //Add ToolbarMenu here: Task Sorting and Filtering options
                    ToolbarMenu(viewModel: viewModel)
                }
                
                //Toolbar item with a pulse effect for Adding new task
                ToolbarItem(placement: .bottomBar) {
                    Button(action: {
                        withAnimation(.easeInOut(duration: 0.2)) {
                            isPulsing = true
                        }
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                            withAnimation(.easeInOut(duration: 0.2)) {
                                isPulsing = false
                            }
                        }
                        showTaskCreation = true
                    }) {
                        Image(systemName: "plus")
                            .scaleEffect(isPulsing ? 1.2 : 1)
                            .animation(.easeInOut(duration: 0.2), value: isPulsing)
                    }
                    .accessibilityLabel("Add new task")
                    .accessibilityIdentifier("Add new task")
                    .accessibilityHint("Tap to create a new task")
                    .keyboardShortcut("n", modifiers: .command)
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        showSettings = true
                    }) {
                        Image(systemName: "gearshape")
                    }
                    .accessibilityLabel("Settings")
                    .accessibilityHint("Tap to open settings")
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        isEditing.toggle() // Toggle edit mode
                    }) {
                        Text(isEditing ? "Done" : "Edit")
                            .font(.body)
                    }
                    .accessibilityLabel(isEditing ? "Done editing" : "Edit tasks")
                    .accessibilityHint("Tap to toggle edit mode")
                }
            }
            .tint(viewModel.accentColor.color)
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    isLoading = false
                }
            }
            .environment(\.editMode, .constant(isEditing ? .active : .inactive))
            .sheet(isPresented: $showTaskCreation) {
                //Add Task Creation view here
                TaskCreationView(viewModel: viewModel)
            }
            .sheet(isPresented: $showSettings) {
                //Add Setting view here
                SettingsView(viewModel: viewModel)
            }
        } detail: {
            // Detail view: Show details of the selected task or a placeholder
            if let selectedTask = selectedTask {
                TaskDetailView(task: selectedTask, viewModel: viewModel)
                    .navigationTitle(selectedTask.title)
            } else {
                Text("Select a task to view details")
                    .font(.largeTitle)
                    .foregroundColor(.gray)
            }
        }
    }
}

#Preview {
    TaskListView(context: PersistenceController.preview.container.viewContext)
        .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}
