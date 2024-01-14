//
//  Models.swift
//  ToDo
//
//  Created by Danielle Lewis on 1/13/24.
//

import SwiftUI
import SwiftData

@Model
class TodoList: Identifiable {
    var title: String
    
    @Relationship(deleteRule: .cascade)
    var items: [TodoItem] = []
    
    init(title: String, items: [TodoItem] = []) {
        self.title = title
        self.items = []
    }
}

@Model
class TodoItem: Identifiable {
    var title: String
    var isDone: Bool = false
    
    init(title: String) {
        self.title = title
    }
}
