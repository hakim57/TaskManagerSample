//
//  Persistence.swift
//  TaskManagerDemo
//
//  Created by Hakim Bohra on 3/16/25.
//

import CoreData

struct PersistenceController {
    
    let container: NSPersistentContainer
    
    init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "TaskManagerDemo")
        if inMemory {
            container.persistentStoreDescriptions.first?.url = URL(fileURLWithPath: "/dev/null")
        }
        container.loadPersistentStores { _, error in
            if let error = error as NSError? {
                fatalError("Failed to load Core Data stores: \(error)")
            }
        }
    }
    
    var context: NSManagedObjectContext { container.viewContext }
    
    func save() {
        if context.hasChanges {
            do {
                try context.save()
            } catch let error as NSError {
                NSLog("Unresolved error saving context: \(error), \(error.userInfo)")
            }
        }
    }
    
    // Preview context with sample data
    static var preview: PersistenceController = {
        let result = PersistenceController(inMemory: true)
        let viewContext = result.container.viewContext
        PreviewData.createPreviewTasks(in: viewContext)
        return result
    }()
}


struct PreviewData {
    static func createPreviewTasks(in context: NSManagedObjectContext) {
        let priorities = ["Low", "Medium", "High"]
        let titles = ["Buy groceries", "Finish project", "Call mom", "Go for a run", "Read a book"]
        
        for i in 0..<10 {
            let task = TaskItem(context: context)
            task.id = UUID()
            task.title = "\(titles[i % titles.count]) \(i + 1)"
            task.priority = priorities[i % priorities.count]
            task.dueDate = Calendar.current.date(byAdding: .day, value: i, to: Date()) ?? Date()
            task.isCompleted = Bool.random()
        }
        do {
            try context.save()
        } catch {
            print("Failed to save preview tasks: \(error)")
        }
    }
}

