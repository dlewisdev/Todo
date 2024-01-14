//
//  TodoListView.swift
//  ToDo
//
//  Created by Danielle Lewis on 1/13/24.
//

import SwiftUI

struct TodoListView: View {
    @State var list: TodoList
    
    @State private var showAddTodoAlert: Bool = false
    @State private var newTodoTitle: String = ""
    
    var body: some View {
        VStack(alignment: .leading) {
            Section(list.items.isEmpty ? "" : "Todo") {
                List(list.items.filter { $0.isDone == false }) { item in
                    HStack {
                        Button {
                            let itemIndex = list.items.firstIndex(where: { $0.id == item.id })
                            if let itemIndex {
                                list.items[itemIndex].isDone.toggle()
                            }
                        } label: {
                            Image(systemName: item.isDone ? "circle.fill" : "circle")
                                .foregroundStyle(.blue)
                        }
                        
                        Text(item.title)
                        Spacer()
                    }
                    .toggleStyle(.button)
                    
                }
                .listRowHoverEffectDisabled()
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
                        let todo = TodoItem(title: newTodoTitle, isDone: false)
                        list.items.append(todo)
                    }
                }
            }
            
            Section(list.items.filter { $0.isDone == true }.isEmpty ? "" : "Completed") {
                List(list.items.filter { $0.isDone == true }) { item in
                    HStack {
                        Button {
                            let itemIndex = list.items.firstIndex(where: { $0.id == item.id })
                            if let itemIndex {
                                list.items[itemIndex].isDone.toggle()
                            }
                        } label: {
                            Image(systemName: item.isDone ? "circle.fill" : "circle")
                                .foregroundStyle(.blue)
                        }
                        
                        Text(item.title)
                        Spacer()
                    }
                    .toggleStyle(.button)
                    
                }
                .listRowHoverEffectDisabled()
                .id(list.id)
            }
        }
    }
}

#Preview {
    TodoListView(list: TodoList(title: "Test List", items: [TodoItem(title: "Test", isDone: false), TodoItem(title: "Test 2", isDone: true), TodoItem(title: "Test 3", isDone: false), TodoItem(title: "Test 4", isDone: true)]))
}
