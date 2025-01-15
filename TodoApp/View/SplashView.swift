//
//  SplashView.swift
//  TodoApp
//
//  Created by Tayyip Güzel on 13.01.2025.
//

import SwiftUI

struct SplashView: View {
    @Environment(\.router) var router
    @State private var size = 0.7
    @State private var opacity = 0.5

    var body: some View {
        let screenWidth = UIScreen.main.bounds.width
        let imageSize = screenWidth * 0.4
        Image("Logo")
            .resizable()
            .scaledToFit()
            .frame(width: imageSize, height: imageSize)
            .scaleEffect(size)
            .opacity(opacity)
            .onAppear {
                withAnimation(.easeIn(duration: 0.5)) {
                    self.size = 1
                    self.opacity = 1.0
                }
                Task {
                    try? await Task.sleep(for: .seconds(1))
                    router.replaceRoot(to: .home)
                }
            }
            .navigationBarBackButtonHidden()
    }
        
}

#Preview {
    SplashView()
}
