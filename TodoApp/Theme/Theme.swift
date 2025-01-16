//
//  Theme.swift
//  TodoApp
//
//  Created by Tayyip Güzel on 15.01.2025.
//

import SwiftUI

struct Theme {
    let backgorund: Color
    let onBackground: Color
    
    let primary: Color
    let onPrimary: Color
    
    let checkbox: Color
    let fill: Color
    let disabled: Color
    let colorScheme: ColorScheme
    
    static let light = Theme(
        backgorund: .lightBackground,
        onBackground: .lightOnBackground,
        primary: .lightPrimary,
        onPrimary: .lightOnPrimary,
        checkbox: .lightCheckbox,
        fill: .lightFill,
        disabled: .lightDisabled,
        colorScheme: .light
    )
    
    static let dark = Theme(
        backgorund: .darkBackground,
        onBackground: .darkOnBackground,
        primary: .darkPrimary,
        onPrimary: .darkOnPrimary,
        checkbox: .darkCheckbox,
        fill: .darkFill,
        disabled: .darkDisabled,
        colorScheme: .dark
    )
    
    static let blue = Theme(
        backgorund: .blueBackground,
        onBackground: .blueOnBackground,
        primary: .bluePrimary,
        onPrimary: .blueOnPrimary,
        checkbox: .blueCheckbox,
        fill: .blueFill,
        disabled: .blueDisabled,
        colorScheme: .light
    )
    
    static let green = Theme(
        backgorund: .greenBackground,
        onBackground: .greenOnBackground,
        primary: .greenPrimary,
        onPrimary: .greenOnPrimary,
        checkbox: .greenCheckbox,
        fill: .greenFill,
        disabled: .greenDisabled,
        colorScheme: .light
    )
    
    static let gold = Theme(
        backgorund: .goldBackground,
        onBackground: .goldOnBackground,
        primary: .goldPrimary,
        onPrimary: .goldOnPrimary,
        checkbox: .goldCheckbox,
        fill: .goldFill,
        disabled: .goldDisabled,
        colorScheme: .dark
    )
}

enum ThemeType: String, CaseIterable, Codable {
    case light
    case dark
    case blue
    case green
    case gold
    
    var theme: Theme {
        switch self {
        case .light:
            return Theme.light
        case .dark:
            return Theme.dark
        case .blue:
            return Theme.blue
        case .green:
            return Theme.green
        case .gold:
            return Theme.gold
        }
    }
    
}

extension Theme {
    static func from(_ type: ThemeType) -> Theme {
        type.theme
    }
    
    var type: ThemeType {
        if self.backgorund == Theme.light.backgorund { return .light }
        if self.backgorund == Theme.dark.backgorund { return .dark }
        if self.backgorund == Theme.blue.backgorund { return .blue }
        if self.backgorund == Theme.green.backgorund { return .green }
        if self.backgorund == Theme.gold.backgorund { return .gold }
        return .blue
    }
}

private struct ThemeEnvironmentKey: EnvironmentKey {
    static let defaultValue: Theme = .light
}

extension EnvironmentValues {
    var theme: Theme {
        get { self[ThemeEnvironmentKey.self] }
        set { self[ThemeEnvironmentKey.self] = newValue }
    }
}
