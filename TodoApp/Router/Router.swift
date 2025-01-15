//
//  Router.swift
//  TodoApp
//
//  Created by Tayyip Güzel on 13.01.2025.
//

import SwiftUI

@Observable
final class Router {
    var stack: [Route] = []
    var root: Route

    public init(root: Route) {
        self.root = root
        stack = [root]
    }

    public func navigate(to route: Route) {
        stack.append(route)
    }

    public func pop() {
        if canPop() {
            stack.removeLast()
        }
    }

    public func popUntil(to route: Route) {
        for item in stack.reversed() {
            if item == route {
                return
            }

            pop()
        }
    }
    
    public func replace(to route: Route) {
        stack.replaceLast(with: route)
    }

    public func popToRoot() {
        stack = []
    }

    public func replaceRoot(to route: Route) {
        popToRoot()
        root = route
    }

    public func canPop() -> Bool {
        return !stack.isEmpty
    }
}

struct RouterKey: EnvironmentKey {
    static let defaultValue: Router = Router(root: .splash)
}

extension EnvironmentValues {
    var router: Router {
        get { self[RouterKey.self] }
        set { self[RouterKey.self] = newValue }
    }
}


extension Array {
    mutating func replaceLast(with newElement: Element) {
        if let lastIndex = self.indices.last {
            self[lastIndex] = newElement
        }
    }
}
