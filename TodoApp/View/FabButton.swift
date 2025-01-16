//
//  FabButton.swift
//  TodoApp
//
//  Created by Tayyip Güzel on 15.01.2025.
//

import SwiftUI

struct FABButton: View {
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
                        .background(.accent)
                        .foregroundColor(.onAccent)
                        .clipShape(Circle())
                        .shadow(color: .black.opacity(0.3), radius: 5, x: 2, y: 2)
                }
                .padding()
            }
        }
    }
}

#Preview {
    FABButton(onPress: {})
}
