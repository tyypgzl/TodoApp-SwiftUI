//
//  TodoAppApp.swift
//  TodoApp
//
//  Created by Tayyip Güzel on 13.01.2025.
//

import SwiftUI
import UIKit

@main
struct TodoApp: App {
    @State private var router: Router = Router(root: .splash)
    @AppStorage("selected_theme") private var selectedThemeType: ThemeType = .blue
    @State private var theme: Theme = .blue
    
    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $router.stack) {
                router.root.body
                    .navigationDestination(for: Route.self) { route in
                        route.body
                    }
            }
            .environment(\.router, router)
            .environment(\.theme, theme)
            .preferredColorScheme(theme.colorScheme)
            .accentColor(theme.primary)
            .onChange(of: selectedThemeType) { _, newValue in
                theme = Theme.from(newValue)
            }
        }
    }
}
