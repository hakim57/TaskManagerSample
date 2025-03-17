//
//  TaskValueItem.swift
//  TaskManagerDemo
//
//  Created by Hakim Bohra on 3/17/25.
//

import Foundation

struct TaskValueItem {
    let id: UUID
    let title: String
    let taskDesc: String?
    let dueDate: Date
    let isCompleted: Bool
    let priority: String
}
