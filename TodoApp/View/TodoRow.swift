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

    var body: some View {
        VStack {
            HStack {
                Toggle(isOn: $todo.completed) {
                    Text(todo.title)
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                        .padding(.leading)
                        
                    if todo.subTodos.count > 0 {
                        Image(systemName: "chevron.down")
                            .padding(.trailing)
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
                
            }

        }
        .onTapGesture {
            showSubTodos.toggle()
        }
        .background(showSubTodos && todo.subTodos.count > 0 ? Color(red: 238, green: 238, blue: 238) : .white)
       
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
