//
//  ProgressIndicatorAnimation.swift
//  SwiftUIDemo
//
//  Created by Lawrence Wu 吳易隆 on 2024/6/20.
//

import SwiftUI

struct ProgressIndicatorAnimation: View {
    
    @State var progress: Double = 0.0
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(Color(.systemGray5), lineWidth: 10)
                .frame(width: 100, height: 100)
            Circle()
                .trim(from: 0, to: progress)
                .stroke(Color(.green), lineWidth: 10)
                .frame(width: 100, height: 100)
                .rotationEffect(Angle(degrees: -90))
                .overlay {
                    Text("\(Int(progress * 100)) %")
                }
                .onAppear(perform: {
                    Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) { time in
                        self.progress += 0.05
                        if self.progress >= 1.0 {
                            time.invalidate()
                        }
                    }
                })
        }
    }
}

#Preview {
    ProgressIndicatorAnimation()
}
