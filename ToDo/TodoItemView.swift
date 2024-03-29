//
//  TodoItemView.swift
//  ToDo
//
//  Created by Danielle Lewis on 1/14/24.
//

import SwiftUI
import SwiftData

struct TodoItemView: View {
    @Environment(\.modelContext) var context
    
    @State var list: TodoList
    
    @State private var showAddTodoAlert: Bool = false
    @State private var newTodoTitle: String = ""
    
    @State var showingCompleted: Bool
    
    var body: some View {
        Section(list.items.isEmpty ? "" :
                    showingCompleted == false ? "Todo" :
                    list.items.filter { $0.isDone == showingCompleted }.isEmpty ? "" : "Completed") {
            
            List(list.items.filter { $0.isDone == showingCompleted }) { item in
                ItemRowView(item: item)
                    .id(item.id)
            }
        }
    }
}

#Preview {
    TodoItemView(list: TodoList(title: "Test List", items: [TodoItem(title: "Test"), TodoItem(title: "Test 2"), TodoItem(title: "Test 3"), TodoItem(title: "Test 4")]), showingCompleted: false)
}
