//
//  ToDoApp.swift
//  ToDo
//
//  Created by Danielle Lewis on 1/13/24.
//

import SwiftUI

@main
struct ToDoApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: [TodoItem.self, TodoList.self])
    }
}
