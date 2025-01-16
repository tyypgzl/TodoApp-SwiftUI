//
//  AddTodoView.swift
//  TodoApp
//
//  Created by Tayyip Güzel on 15.01.2025.
//

import SwiftUI

struct AddTodoView: View {
    @State var todo: String = ""
    @State var subTodo: String = ""
    @State var subTodoList: [SubTodo] = []
    @State var isPresentedAlert: Bool = false

    @Environment(\.dismiss) var dismiss
    @Binding var viewModel: TodoViewModel

    var body: some View {
        VStack(alignment: .leading) {
            Text("Todo:")
                .font(.subheadline)
            TextField(text: $todo) {
                Text("Read a book...")
            }
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .padding(.bottom)

            Text("Sub Todos:")
                .font(.subheadline)
            HStack {
                TextField(text: $subTodo) {
                    Text("Read a book...")
                }
                if !subTodo.isEmpty {
                    Button(action: {
                        subTodoList.append(SubTodo(title: subTodo, completed: false))
                    }) {
                        Image(systemName: "plus")
                    }
                }
            }
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .padding(.bottom)
            LazyVStack {
                ForEach(subTodoList) { subTodo in

                    Text(subTodo.title)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .fontWeight(Font.Weight.medium)
                        .font(.headline)
                        .padding(8)
                        .padding(.vertical, 4)
                        .background(
                            RoundedRectangle(cornerRadius: 4)
                                .fill(Color.white)
                        )
                        .foregroundColor(Color.black)
                }
            }
            .listStyle(.plain)
            Spacer()
        }
        .padding()
        .toolbar {
            ToolbarItem(placement: .confirmationAction) {
                Button(action: {
                    if todo.isEmpty {
                        isPresentedAlert = true
                        return
                    }
                    let todo = Todo(title: todo, completed: false, subTodos: subTodoList)
                    viewModel.todos.append(todo)
                    viewModel.isAddTodoSheetPresented = false
                }) {
                    Text("Add")
                }
            }

            ToolbarItem(placement: .cancellationAction) {
                Button(action: {
                    dismiss()
                    viewModel.isAddTodoSheetPresented = false
                }) {
                    Text("Close")
                }
            }
        }
        .navigationTitle("Add Todo")
        .navigationBarTitleDisplayMode(.inline)
        .alert(isPresented: $isPresentedAlert) {
            Alert(
                title: Text("Warning"),
                message: Text("Please enter valid todo"),
                dismissButton: Alert.Button.destructive(Text("Ok")
                )
            )
        }
    }
}

#Preview {
    NavigationStack {
        AddTodoView(viewModel: .constant(TodoViewModel()))
    }
}
