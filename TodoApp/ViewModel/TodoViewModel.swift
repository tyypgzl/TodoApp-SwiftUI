//
//  HomeViewModel.swift
//  TodoApp
//
//  Created by Tayyip Güzel on 13.01.2025.
//

import SwiftUI

@Observable
final class TodoViewModel {
    var todos: [Todo] = [
        Todo(
            title: "SwiftUI",
            completed: false,
            subTodos: [
                SubTodo(title: "Box Modal", completed: false),
                SubTodo(title: "Grids and Container", completed: true),
                SubTodo(title: "Negative Space", completed: true)
            ]
            
        ),
        Todo(
            title: "Combine",
            completed: false,
            subTodos: []
        ),
        Todo(
            title: "UIKit",
            completed: false,
            subTodos: []
        ),
    ]
}
