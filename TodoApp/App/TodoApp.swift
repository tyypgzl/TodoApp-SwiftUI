//
//  TodoAppApp.swift
//  TodoApp
//
//  Created by Tayyip Güzel on 13.01.2025.
//

import SwiftUI

@main
struct TodoApp: App {
    @State var router: Router = Router(root: .splash)
    
    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $router.stack) {
                router.root.body
                    .navigationDestination(for: Route.self) { route in
                        route.body
                    }
            }
            .environment(\.router, router)
        }
    }
}
