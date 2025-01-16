//
//  FabButton.swift
//  TodoApp
//
//  Created by Tayyip Güzel on 15.01.2025.
//

import SwiftUI

struct FABButton: View {
    @Environment(\.theme) var theme
    let onPress: () -> Void
    
    var body: some View {
        VStack {
            Spacer()
            HStack {
                Spacer()
                Button(action: onPress) {
                    Image(systemName: "plus")
                        .font(.system(size: 24))
                        .padding()
                        .background(theme.primary)
                        .foregroundColor(theme.onPrimary)
                        .clipShape(Circle())
                        .shadow(color: theme.onBackground.opacity(0.3), radius: 5, x: 2, y: 2)
                }
                .padding()
            }
        }
    }
}

#Preview {
    FABButton(onPress: {})
}
