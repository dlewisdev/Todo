//
//  TodoListView.swift
//  ToDo
//
//  Created by Danielle Lewis on 1/13/24.
//

import SwiftUI

struct TodoListView: View {
    let list: TodoList
    
    @State private var showAddTodoAlert: Bool = false
    @State private var newTodoTitle: String = ""
    
    var body: some View {
        List(list.items) { item in
            Text(item.title)
        }
        .navigationTitle("Details for \(list.title)")
        .toolbar {
            Button("Add Todo") {
                showAddTodoAlert.toggle()
            }
        }
        .id(list.id)
        .alert("Add Todo", isPresented: $showAddTodoAlert) {
            TextField("Todo List Title", text: $newTodoTitle)
            Button("Cancel", role: .cancel, action: {})
            Button("Create") {
               
            }
        }
    }
}

#Preview {
    TodoListView(list: TodoList(title: "Test List", items: []))
}
