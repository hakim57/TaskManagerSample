//
//  TaskViewModel.swift
//  TaskManagerDemo
//
//  Created by Hakim Bohra on 3/16/25.
//


import CoreData
import SwiftUI

class TaskViewModel: ObservableObject {
    @Published var tasks: [TaskItem] = []
    @Published var sortOption: SortOption = .byPriority
    @Published var filterOption: FilterOption = .all
    @Published var accentColor: AccentColor = .blue  // Default accent color
    
    let context: NSManagedObjectContext
    
    init(context: NSManagedObjectContext) {
        self.context = context
        fetchTasks()
    }
    
    func fetchTasks() {
        let request: NSFetchRequest<TaskItem> = TaskItem.fetchRequest()
        
        // Apply sorting
        switch sortOption {
        case .byPriority:
            request.sortDescriptors = [NSSortDescriptor(keyPath: \TaskItem.priority_, ascending: false)]
        case .byDueDate:
            request.sortDescriptors = [NSSortDescriptor(keyPath: \TaskItem.dueDate_, ascending: true)]
        case .alphabetically:
            request.sortDescriptors = [NSSortDescriptor(keyPath: \TaskItem.title_, ascending: true)]
        }
        
        // Apply filtering
        switch filterOption {
        case .all:
            break
        case .completed:
            request.predicate = NSPredicate(format: "isCompleted_ == true")
        case .pending:
            request.predicate = NSPredicate(format: "isCompleted_ == false")
        }
        
        do {
            tasks = try context.fetch(request)
        } catch {
            print("Failed to fetch tasks: \(error)")
        }
    }
    
    func saveContext() {
        do {
            try context.save()
            fetchTasks() // Refresh the task list
        } catch {
            print("Failed to save context: \(error)")
        }
    }
    
    func moveTask(from source: IndexSet, to destination: Int) {
        tasks.move(fromOffsets: source, toOffset: destination)
    }
    
    func toggleTaskCompletion(_ task: TaskItem) {
        task.isCompleted.toggle()
        saveContext()
    }
    
    func deleteTask(_ task: TaskItem) {
        context.delete(task)
        saveContext()
    }
    
    func undoDelete(_ task: TaskValueItem) {
        addTask(title: task.title, description: task.taskDesc, priority: task.priority, dueDate: task.dueDate)
        saveContext()
    }
    
    var completionPercentage: Double {
        guard !tasks.isEmpty else { return 0 }
        let completedTasks = tasks.filter { $0.isCompleted }.count
        return Double(completedTasks) / Double(tasks.count)
    }
    
    func addTask(title: String, description: String?, priority: String, dueDate: Date) {
        let newTask = TaskItem(context: context)
        newTask.id = UUID()
        newTask.title = title
        newTask.taskDesc = description
        newTask.priority = priority
        newTask.dueDate = dueDate
        newTask.isCompleted = false
    }
}
