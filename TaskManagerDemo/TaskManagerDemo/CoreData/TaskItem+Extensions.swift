//
//  TaskItem.swift
//  TaskManagerDemo
//
//  Created by Hakim Bohra on 3/16/25.
//

import Foundation
import CoreData

extension TaskItem {
    var title: String {
        get { title_ ?? "" }
        set { title_ = newValue }
    }
    
    var taskDesc: String? {
        get { taskDesc_ }
        set { taskDesc_ = newValue }
    }
    
    var isCompleted: Bool {
        get { isCompleted_ }
        set { isCompleted_ = newValue }
    }
    
    var dueDate: Date {
        get { dueDate_ ?? Date() }
        set { dueDate_ = newValue }
    }
    
    var priority: String {
        get { priority_ ?? TaskPriority.low.rawValue }
        set { priority_ = newValue }
    }
}
