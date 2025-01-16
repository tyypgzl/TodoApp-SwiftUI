//
//  TodoRow.swift
//  TodoApp
//
//  Created by Tayyip Güzel on 14.01.2025.
//

import SwiftUI

struct TodoRow: View {
    @Binding var todo: Todo
    @State var showSubTodos: Bool = false
    @Environment(\.theme) var theme

    var body: some View {
        VStack {
            HStack {
                Toggle(isOn: $todo.completed) {
                    Text(todo.title)
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                        .padding(.leading)
                        .foregroundColor(theme.onBackground)
                        
                    if todo.subTodos.count > 0 {
                        Image(systemName: "chevron.down")
                            .padding(.trailing)
                            .foregroundColor(theme.onBackground)
                    }
                }
            }
            .toggleStyle(TodoCheckbox())
            .padding([.top, .bottom, .leading])
            
            if showSubTodos {
                VStack {
                    ForEach($todo.subTodos) { $subTodo in
                        Toggle(isOn: $subTodo.completed) {
                            Text(subTodo.title)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.leading)
                        }
                        .toggleStyle(SubTodoCheckbox())
                        .padding(8)
                        .padding(.leading, 40)
                    }
                }
                .foregroundColor(theme.onBackground)
                
            }
        }
        .onTapGesture {
            showSubTodos.toggle()
        }
        .background(showSubTodos && todo.subTodos.count > 0 ? theme.fill : theme.backgorund)
       
    }
}



#Preview {
    TodoRow(
        todo: .constant(
            Todo(
                title: "Todo",
                completed: false,
                subTodos: [
                    SubTodo(title: "Sub1", completed: true),
                    SubTodo(title: "Sub2", completed: false),
                ]
            )
        )
    )
}
