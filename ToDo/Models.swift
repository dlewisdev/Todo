//
//  Models.swift
//  ToDo
//
//  Created by Danielle Lewis on 1/13/24.
//

import SwiftUI

struct TodoList: Identifiable {
    let id = UUID()
    let title: String
    
    var items: [TodoItem]
}

struct TodoItem: Identifiable {
    let id = UUID()
    let title: String
    var isDone: Bool
}
