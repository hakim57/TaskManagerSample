//
//  TaskList.swift
//  TaskManagerDemo
//
//  Created by Hakim Bohra on 3/16/25.
//


import CoreData
import SwiftUI

struct TaskListView: View {
    @StateObject private var viewModel: TaskViewModel
    @Environment(\.managedObjectContext) private var context
    
    var body: some View {
        EmptyView()
    }
}
