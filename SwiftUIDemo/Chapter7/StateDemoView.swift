//
//  StateDemoView.swift
//  SwiftUIDemo
//
//  Created by Lawrence Wu 吳易隆 on 2024/6/18.
//

import SwiftUI

struct StateDemoView: View {
    
    @State private var isPlaying: Bool = false
    
    @State private var counter1: Int = 0
    @State private var counter2: Int = 0
    @State private var counter3: Int = 0
    
    var body: some View {
        ScrollView {
            VStack(content: {
                Button {
                    /// toggle can switch Bool
                    self.isPlaying.toggle()
                } label: {
                    Image(systemName: isPlaying ? "stop.circle.fill" : "play.circle.fill")
                        .font(.system(size: 150))
                        .foregroundStyle(isPlaying ? .red : .green)
                }
                
                Spacer(minLength: 100)
                
                VStack(spacing: 20, content: {
                    Text("\(counter1 + counter2 + counter3)")
                        .font(.system(size: 150, weight: .bold, design: .rounded))
                    HStack(content: {
                        CounterButton(counter: $counter1, color: .red)
                        CounterButton(counter: $counter2, color: .blue)
                        CounterButton(counter: $counter3, color: .green)
                    })
                })
            })
            .frame(minWidth: 0, maxWidth: .infinity)
        }
    }
}

struct CounterButton: View {
    
    @Binding var counter: Int
    var color: Color
    
    var body: some View {
        Button(action: {
            self.counter += 1
        }, label: {
            Circle()
                .frame(width: 100, height: 100)
                .foregroundStyle(color)
                .overlay {
                    Text("\(self.counter)")
                        .font(.system(size: 50, weight: .bold, design: .rounded))
                        .foregroundStyle(.white)
                }
        })
    }
}

#Preview {
    StateDemoView()
}
