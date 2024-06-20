//
//  RectangleProgressAnimation.swift
//  SwiftUIDemo
//
//  Created by Lawrence Wu 吳易隆 on 2024/6/20.
//

import SwiftUI

struct RectangleProgressAnimation: View {
    
    @State private var isLoading = false
    
    var body: some View {
        ZStack(content: {
            Text("Loading")
                .font(.system(.body, design: .rounded))
                .bold().offset(x: 0, y: -25)
            
            RoundedRectangle(cornerRadius: 3.0)
                .stroke(Color(.systemGray5), lineWidth: 3.0)
                .frame(width: 250, height: 5)
                .background(Color(.systemGray5))
            
            RoundedRectangle(cornerRadius: 3.0)
                .stroke(Color(.green), lineWidth: 3.0)
                .frame(width: 30, height: 5)
                .background(.green)
                .offset(x: isLoading ? 110 : -110, y: 0)
                .animation(.linear(duration: 0.5).repeatForever(autoreverses: false), value: isLoading)
                .onAppear(perform: {
                    self.isLoading = true
                })
        })
    }
}

#Preview {
    RectangleProgressAnimation()
}
