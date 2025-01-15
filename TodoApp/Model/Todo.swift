//
//  Todo.swift
//  TodoApp
//
//  Created by Tayyip Güzel on 13.01.2025.
//

import Foundation

struct Todo: Identifiable {
    let id: UUID
    let title: String
    var completed: Bool
    var subTodos: [SubTodo]

    
    init(id: UUID = UUID(), title: String, completed: Bool, subTodos: [SubTodo]) {
        self.id = id
        self.title = title
        self.completed = completed
        self.subTodos = subTodos
    }
}

struct SubTodo: Identifiable {
    let id: UUID
    let title: String
    var completed: Bool
    
    init(id: UUID = UUID(), title: String, completed: Bool) {
        self.id = id
        self.title = title
        self.completed = completed
    }
}
