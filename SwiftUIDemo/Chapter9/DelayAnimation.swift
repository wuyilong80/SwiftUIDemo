//
//  DelayAnimation.swift
//  SwiftUIDemo
//
//  Created by Lawrence Wu 吳易隆 on 2024/6/20.
//

import SwiftUI

struct DelayAnimation: View {
    
    @State var isLoading: Bool = false
    
    var body: some View {
        HStack(content: {
            ForEach(0 ..< 5, id: \.self) { index in
                Circle()
                    .frame(width: 10, height: 10)
                    .foregroundStyle(self.isLoading ? .green : .blue)
                    .scaleEffect(self.isLoading ? 0 : 1)
                    .animation(.linear(duration: 1.0).repeatForever().delay(0.2 * Double(index)), value: isLoading)
            }
        })
        .onAppear(perform: {
            self.isLoading = true
        })
    }
}

#Preview {
    DelayAnimation()
}
