//
//  RotationEffectAnimation.swift
//  SwiftUIDemo
//
//  Created by Lawrence Wu 吳易隆 on 2024/6/20.
//

import SwiftUI

struct RotationEffectAnimation: View {
    
    @State private var isLoading = false
    
    var body: some View {
        ZStack(alignment: .center) {
            Circle()
                .stroke(Color(.systemGray5), lineWidth: 15.0)
                .frame(width: 100, height: 100)
            Circle()
                .trim(from: 0.0 , to: 0.2)
                .stroke(.green, lineWidth: 10.0)
                .frame(width: 100, height: 100)
                .rotationEffect(Angle(degrees: isLoading ? 360 : 0))
                .animation(.linear(duration: 0.5).repeatForever(autoreverses: false), value: isLoading)
                .onAppear(perform: {
                    self.isLoading = true
                })
        }
    }
}

#Preview {
    RotationEffectAnimation()
}
