//
//  ItemRowView.swift
//  ToDo
//
//  Created by Danielle Lewis on 1/14/24.
//

import SwiftUI

struct ItemRowView: View {
    @Environment(\.modelContext) private var context
    
    @State private var selectedItem: TodoItem? = nil
    @State private var showingAlert: Bool = false
    
    var item: TodoItem
    

    var body: some View {
        
        HStack {
            Button {
                item.isDone.toggle()
            } label: {
                Image(systemName: item.isDone ? "circle.fill" : "circle")
                    .foregroundStyle(.blue)
            }
            Text(item.title)
            Spacer()
        }
        .toggleStyle(.button)
        .swipeActions {
            Button("Delete") {
                selectedItem = item
                showingAlert = true
            }
            .tint(.red)
        }
        .alert("Delete?", isPresented: $showingAlert) {
            Button("Cancel", role: .cancel) {}
            Button("Delete", role: .destructive) {
                if let selectedItem {
                    context.delete(selectedItem)
                    do {
                        try context.save()
                    } catch {
                        print("Error \(error.localizedDescription)")
                    }
                }
                selectedItem = nil
            }
        }
    }
}

#Preview {
    ItemRowView(item: TodoItem(title: "Test"))
}
