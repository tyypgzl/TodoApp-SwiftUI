//
//  Checkbox.swift
//  TodoApp
//
//  Created by Tayyip Güzel on 14.01.2025.
//

import SwiftUI

struct TodoCheckbox: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        let unSelectedColor = Color(red: 51, green: 51, blue: 51)
        let selectedColor = Color(red: 255, green: 90, blue: 96)
        HStack {
            RoundedRectangle(cornerRadius: 6)
                .strokeBorder(configuration.isOn ? selectedColor : unSelectedColor, lineWidth: 2)
                .background(
                    RoundedRectangle(cornerRadius: 6)
                        .fill(configuration.isOn ? selectedColor : unSelectedColor)
                )
                .frame(width: 26, height: 26)
                .overlay(
                    configuration.isOn
                        ? Image(systemName: "checkmark")
                            .foregroundColor(.white)
                            .font(.system(size: 14, weight: .bold))
                        : nil
                )
                .onTapGesture {
                    configuration.isOn.toggle()
                }
            
            configuration.label
                .strikethrough(configuration.isOn)
                .foregroundColor(configuration.isOn ? .gray : .black)
        }
    }
}

struct SubTodoCheckbox: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        let unSelectedColor = Color(red: 51, green: 51, blue: 51)
        let selectedColor = Color(red: 255, green: 89, blue: 96)
        HStack {
            Circle()
                .strokeBorder(configuration.isOn ? Color.clear : unSelectedColor, lineWidth: 4)
                .frame(width: 26, height: 26)
                .overlay(
                    configuration.isOn
                        ? Image(systemName: "checkmark")
                        .foregroundColor(configuration.isOn ? selectedColor : .white)
                            .font(.system(size: 18, weight: .bold))
                        : nil
                )
                .onTapGesture {
                    configuration.isOn.toggle()
                }
            
            configuration.label
                .strikethrough(configuration.isOn)
                .foregroundColor(configuration.isOn ? .gray : .black)
        }
    }
}

extension Color {
    init(red: Int, green: Int, blue: Int) {
        self.init(red: Double(red) / 255.0, green: Double(green) / 255.0, blue: Double(blue) / 255.0)
    }
}
