//
//  LongPressGestureView.swift
//  SwiftUIDemo
//
//  Created by Lawrence Wu 吳易隆 on 2024/7/19.
//

import SwiftUI

struct LongPressGestureView: View {
    
    @GestureState private var longPressTap = false
    @State private var isPressed = false
    
    var body: some View {
        Image(systemName: "star.circle.fill")
            .font(.system(size: 200))
            .opacity(longPressTap ? 0.4: 1.0)
            .scaleEffect(isPressed ? 0.5: 1.0)
            .animation(.easeInOut, value: isPressed)
            .foregroundColor(.green)
            .gesture(
                LongPressGesture(minimumDuration: 1.0)
                    .updating($longPressTap, body: { currentState, state, transcation in
                        state = currentState
                    })
                    .onEnded({ _ in
                        self.isPressed.toggle()
                    })
            )
    }
}

#Preview {
    LongPressGestureView()
}
