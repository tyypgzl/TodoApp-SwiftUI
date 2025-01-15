//
//  AppRoute.swift
//  TodoApp
//
//  Created by Tayyip Güzel on 13.01.2025.
//

import SwiftUI

enum Route: Hashable {
    case splash
    case home
    
    @ViewBuilder
    var body: some View {
        switch self {
        case .splash: SplashView()
        case .home: TodoView()
        }
    }
}
