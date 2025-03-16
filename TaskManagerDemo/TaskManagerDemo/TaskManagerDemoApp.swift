//
//  TaskManagerDemoApp.swift
//  TaskManagerDemo
//
//  Created by Hakim Bohra on 3/16/25.
//

import SwiftUI

@main
struct TaskManagerDemoApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
