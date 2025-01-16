//
//  HomeView.swift
//  TodoApp
//
//  Created by Tayyip Güzel on 13.01.2025.
//

import SwiftUI

struct TodoView: View {
    @State var viewModel = TodoViewModel()
    @Environment(\.theme) var theme
    @State private var isThemeSelectionPresented = false
    
    var body: some View {
        ZStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 0) {
                    ForEach($viewModel.todos) { $todo in
                        TodoRow(todo: $todo)
                    }
                }
                .frame(maxWidth: .infinity)
            }
            FABButton(
                onPress: {
                    viewModel.isAddTodoSheetPresented = true
                }
            )
        }.navigationTitle("tasked")
            .background(theme.backgorund)
            .sheet(isPresented: $viewModel.isAddTodoSheetPresented){
                NavigationStack {
                    AddTodoView(viewModel: $viewModel)
                }
            }
            .sheet(isPresented: $isThemeSelectionPresented) {
                ThemeSelectionView()
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: { isThemeSelectionPresented = true }) {
                        Image(systemName: "paintpalette.fill")
                            .foregroundColor(theme.primary)
                    }
                }
            }
            .toolbarBackground(theme.backgorund, for: .navigationBar, .tabBar)
            .toolbarColorScheme(theme.colorScheme, for: .navigationBar, .tabBar)
    }
}

#Preview {
    TodoView()
}

