//
//  DragGestureView.swift
//  SwiftUIDemo
//
//  Created by Lawrence Wu 吳易隆 on 2024/7/19.
//

import SwiftUI

struct DragGestureView: View {
    
    @GestureState private var dragOffset = CGSizeZero
    @State private var positon = CGSizeZero
    
    var body: some View {
        Image(systemName: "star.circle.fill")
            .font(.system(size: 100))
            .offset(x: dragOffset.width + positon.width, y: dragOffset.height + positon.height)
            .animation(.easeInOut, value: dragOffset)
            .foregroundColor(.green)
            .gesture(
                DragGesture()
                    .updating($dragOffset, body: { value, state, transcation in
                        state = value.translation
                    })
                    .onEnded({ value in
                        self.positon.width += value.translation.width
                        self.positon.height += value.translation.height
                    })
            )
    }
}

#Preview {
    DragGestureView()
}
