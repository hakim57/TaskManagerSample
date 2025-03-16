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
        container = NSPersistentContainer(name: "TaskManagerSample")
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
}


