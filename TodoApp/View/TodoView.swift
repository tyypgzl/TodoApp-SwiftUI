//
//  HomeView.swift
//  TodoApp
//
//  Created by Tayyip Güzel on 13.01.2025.
//

import SwiftUI

struct TodoView: View {
    @State var viewModel = TodoViewModel()
    
    var body: some View {
        let date = Date()
        
        ScrollView {
            VStack(alignment: .leading, spacing: 0) {
                Text("tasked")
                    .font(.title)
                    .bold()
                    .padding()
                
                ForEach($viewModel.todos) { $todo in
                    TodoRow(todo: $todo)
                    
                }
            }
            .frame(maxWidth: .infinity)
        }
        .navigationTitle(Text(date, style: .date))
    }
}

#Preview {
    TodoView()
}
