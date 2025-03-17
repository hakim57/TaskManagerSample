//
//  TaskDetailView.swift
//  TaskManagerDemo
//
//  Created by Hakim Bohra on 3/17/25.
//

import SwiftUI

struct TaskDetailView: View {
    @ObservedObject var task: TaskItem
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var viewModel: TaskViewModel
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}
