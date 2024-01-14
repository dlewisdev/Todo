//
//  ContentView.swift
//  ToDo
//
//  Created by Danielle Lewis on 1/13/24.
//

import SwiftUI

struct ContentView: View {
    @State private var todoLists: [TodoList] = []
    @State private var selectedTodoList: TodoList? = nil
    
    @State private var showAddListAlert: Bool = false
    @State private var newListTitle: String = ""
    
    var body: some View {
        NavigationSplitView {
            List(todoLists) { list in
                Button(list.title) {
                    selectedTodoList = list
                }
            }
            .navigationTitle("Todo Lists")
            .toolbar {
                Button("Add") {
                    showAddListAlert.toggle()
                }
            }
            .alert("Add Todo List", isPresented: $showAddListAlert) {
                TextField("Todo Title", text: $newListTitle)
                Button("Cancel", role: .cancel, action: {})
                Button("Create") {
                    let list = TodoList(title: newListTitle, items: [])
                    todoLists.append(list)
                }
            }
        } detail: {
            VStack {
                if let selectedTodoList {
                    TodoListView(list: selectedTodoList)
                }
            }
            .padding()
        }
    }
}

#Preview(windowStyle: .automatic) {
    ContentView()
}
