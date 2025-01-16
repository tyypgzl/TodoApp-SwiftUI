//
//  Checkbox.swift
//  TodoApp
//
//  Created by Tayyip Güzel on 14.01.2025.
//

import SwiftUI

struct TodoCheckbox: ToggleStyle {
    @Environment(\.theme) var theme
    
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            RoundedRectangle(cornerRadius: 6)
                .strokeBorder(configuration.isOn ? theme.primary : theme.checkbox, lineWidth: 2)
                .background(
                    RoundedRectangle(cornerRadius: 6)
                        .fill(configuration.isOn ? theme.primary : theme.checkbox)
                )
                .frame(width: 26, height: 26)
                .overlay(
                    configuration.isOn
                        ? Image(systemName: "checkmark")
                        .foregroundColor(theme.backgorund)
                            .font(.system(size: 14, weight: .bold))
                        : nil
                )
                .onTapGesture {
                    configuration.isOn.toggle()
                }
            
            configuration.label
                .strikethrough(configuration.isOn)
                .foregroundColor(configuration.isOn ? theme.disabled : theme.onBackground)
        }
    }
}

struct SubTodoCheckbox: ToggleStyle {
    @Environment(\.theme) var theme
    
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            Circle()
                .strokeBorder(configuration.isOn ? Color.clear : theme.checkbox, lineWidth: 4)
                .frame(width: 26, height: 26)
                .overlay(
                    configuration.isOn
                        ? Image(systemName: "checkmark")
                        .foregroundColor(configuration.isOn ? theme.primary : theme.backgorund)
                            .font(.system(size: 18, weight: .bold))
                        : nil
                )
                .onTapGesture {
                    configuration.isOn.toggle()
                }
            
            configuration.label
                .strikethrough(configuration.isOn)
                .foregroundColor(configuration.isOn ? theme.disabled : theme.onBackground)
        }
    }
}
