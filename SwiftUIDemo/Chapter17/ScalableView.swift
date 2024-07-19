//
//  ScalableView.swift
//  SwiftUIDemo
//
//  Created by Lawrence Wu 吳易隆 on 2024/7/19.
//

import SwiftUI

struct ScalableView<Content>: View where Content: View {
    
    @GestureState private var scale: CGFloat = 1.0
    
    var content: () -> Content
    
    var body: some View {
        content()
            .scaleEffect(scale)
            .animation(.default, value: scale)
            .gesture(
                MagnificationGesture()
                    .updating($scale, body: { value, state, transcatoin in
                        state = value
                    })
            )
    }
}

#Preview {
    ScalableView {
        Image(systemName: "headphones")
            .font(.system(size: 100))
            .foregroundColor(.purple)
    }
}
