//
//  TodoListView.swift
//  ToDo
//
//  Created by Danielle Lewis on 1/13/24.
//

import SwiftUI
import SwiftData

struct TodoListView: View {
    @Environment(\.modelContext) var context
    @State var list: TodoList
    
    @State private var showAddTodoAlert: Bool = false
    @State private var newTodoTitle: String = ""
    
   
    
    var body: some View {
        VStack(alignment: .leading) {
                TodoItemView(list: list, showingCompleted: false)
                TodoItemView(list: list, showingCompleted: true)
        }
        .alert("Add Todo", isPresented: $showAddTodoAlert) {
            TextField("Todo List Title", text: $newTodoTitle)
            Button("Cancel", role: .cancel, action: {})
            Button("Create") {
                let todo = TodoItem(title: newTodoTitle)
                list.items.append(todo)
                do {
                    try context.save()
                } catch {
                    print("Error \(error.localizedDescription)")
                }
                newTodoTitle = ""
            }
        }
        .toolbar {
            Button("Add Todo") {
                showAddTodoAlert.toggle()
            }
        }
    }
}

#Preview(windowStyle: .automatic) {
    TodoListView(list: TodoList(title: "Test List", items: [TodoItem(title: "Test"), TodoItem(title: "Test 2"), TodoItem(title: "Test 3"), TodoItem(title: "Test 4")]))
        .modelContainer(for: [TodoItem.self, TodoList.self])
}
