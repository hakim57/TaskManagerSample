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
}
