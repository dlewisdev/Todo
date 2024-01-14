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
                    let list = TodoList(title: "List \(todoLists.count + 1)", items: [])
                    todoLists.append(list)
                }
            }
            
        } detail: {
            
            VStack {
                if let selectedTodoList {
                    Text(selectedTodoList.title)
                        .navigationTitle("Details for \(selectedTodoList.title)")
                }
            }
            .padding()
            
        }
    }
}

#Preview(windowStyle: .automatic) {
    ContentView()
}
