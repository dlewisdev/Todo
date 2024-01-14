//
//  ContentView.swift
//  ToDo
//
//  Created by Danielle Lewis on 1/13/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var context
    
    @Query private var todoLists: [TodoList]
    @State private var selectedTodoList: TodoList? = nil
    
    @State private var showingDeleteTodoAlert: Bool = false
    @State private var showAddListAlert: Bool = false
    @State private var newListTitle: String = ""
    
    
    var body: some View {
        NavigationSplitView {
            List(todoLists) { list in
                Button(list.title) {
                    selectedTodoList = list
                }
                .swipeActions {
                    Button("Delete") {
                        selectedTodoList = list
                        showingDeleteTodoAlert = true
                    }
                    .tint(.red)
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
                    let list = TodoList(title: newListTitle)
                    context.insert(list)
                    do {
                        try context.save()
                    } catch {
                        print("Error \(error.localizedDescription)")
                    }
                    newListTitle = ""
                }
            }
            .alert("Delete?", isPresented: $showingDeleteTodoAlert) {
                Button("Cancel", role: .cancel) {}
                Button("Delete", role: .destructive) {
                    if let selectedTodoList {
                        context.delete(selectedTodoList)
                        do {
                            try context.save()
                        } catch {
                            print("Error \(error.localizedDescription)")
                        }
                    }
                    selectedTodoList = nil
                }
            }
        } detail: {
            VStack {
                if let selectedTodoList {
                    TodoListView(list: selectedTodoList)
                        .navigationTitle("Details for \(selectedTodoList.title)")
                        .id(selectedTodoList.id)
                }
            }
            .padding()
        }
    }
}

#Preview(windowStyle: .automatic) {
    ContentView()
        .modelContainer(for: [TodoItem.self, TodoList.self])
}
