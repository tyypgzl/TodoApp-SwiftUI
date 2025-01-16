//
//  Color.swift
//  TodoApp
//
//  Created by Tayyip Güzel on 16.01.2025.
//

import SwiftUI

extension Color {
    // LIGHT
    static let lightBackground = Color(fromHex: "FFFFFF")
    static let lightOnBackground = Color(fromHex: "111111")
    
    static let lightPrimary = Color(fromHex: "FF5A60")
    static let lightOnPrimary = Color(fromHex: "FFFFFF")
    
    static let lightCheckbox = Color(fromHex: "111111")
    static let lightFill = Color(fromHex: "EEEEEE")
    static let lightDisabled = Color(fromHex: "555555")
    
    // DARK
    static let darkBackground = Color(fromHex: "111111")
    static let darkOnBackground = Color(fromHex: "FFFFFF")
    
    static let darkPrimary = Color(fromHex: "FF5A60")
    static let darkOnPrimary = Color(fromHex: "111111")
    
    static let darkCheckbox = Color(fromHex: "555555")
    static let darkFill = Color(fromHex: "222222")
    static let darkDisabled = Color(fromHex: "555555")
    
    // BLUE
    static let blueBackground = Color(fromHex: "F2F6FF")
    static let blueOnBackground = Color(fromHex: "111111")
    
    static let bluePrimary = Color(fromHex: "5C9DFE")
    static let blueOnPrimary = Color(fromHex: "EEEEEE")
    
    static let blueCheckbox = Color(fromHex: "BED8FF")
    static let blueFill = Color(fromHex: "E8EEFF")
    static let blueDisabled = Color(fromHex: "555555")
    
    // GREEN
    static let greenBackground = Color(fromHex: "EBEBE3")
    static let greenOnBackground = Color(fromHex: "4E5851")
    
    static let greenPrimary = Color(fromHex: "4E5851")
    static let greenOnPrimary = Color(fromHex: "EEEEEE")
    
    static let greenCheckbox = Color(fromHex: "9CA59D")
    static let greenFill = Color(fromHex: "DBDDD8")
    static let greenDisabled = Color(fromHex: "9CA59D")
    
    // GOLD
    static let goldBackground = Color(fromHex: "000000")
    static let goldOnBackground = Color(fromHex: "FAD7BD")
    
    static let goldPrimary = Color(fromHex: "FAD7BD")
    static let goldOnPrimary = Color(fromHex: "000000")
    
    static let goldCheckbox = Color(fromHex: "BFA490")
    static let goldFill = Color(fromHex: "322B26")
    static let goldDisabled = Color(fromHex: "5A4D44")
}

extension Color {
    init(red: Int, green: Int, blue: Int) {
        self.init(red: Double(red) / 255.0, green: Double(green) / 255.0, blue: Double(blue) / 255.0)
    }
}

extension Color {
    init(fromHex hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue: Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}

extension Color {
    func brightness() -> Double {
        guard let components = UIColor(self).cgColor.components else { return 0 }
        
        let red = components[0]
        let green = components[1]
        let blue = components[2]
        
        return (0.299 * red + 0.587 * green + 0.114 * blue)
    }
}
