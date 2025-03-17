//
//  AccentColor.swift
//  TaskManagerDemo
//
//  Created by Hakim Bohra on 3/17/25.
//


import SwiftUI

struct AccentColor: Hashable {
    var name: String
    var color: Color

    // Predefined colors
    static let blue = AccentColor(name: "Blue", color: .blue)
    static let green = AccentColor(name: "Green", color: .green)
    static let orange = AccentColor(name: "Orange", color: .orange)
    static let red = AccentColor(name: "Red", color: .red)
    static let purple = AccentColor(name: "Purple", color: .purple)
    
    // Define the available accent colors
    static let colors: [AccentColor] = [.blue, .green, .orange, .red, .purple]
}
