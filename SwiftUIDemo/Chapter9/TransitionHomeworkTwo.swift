//
//  TransitionHomeworkTwo.swift
//  SwiftUIDemo
//
//  Created by Lawrence Wu 吳易隆 on 2024/6/21.
//

import SwiftUI

struct TransitionHomeworkTwo: View {
    
    private var cards: [CardView] = [
        CardView(image: "swiftui-button", category: "SwiftUI", heading: "Drawing a Border with Rounded Corners", author: "Simon Ng"),
        CardView(image: "macos-programming", category: "macOS", heading: "Building a Simple Editing App", author: "Gabriel Theodoropoulos"),
        CardView(image: "flutter-app", category: "Flutter", heading: "Building a Complex Layout with Flutter", author: "Lawrence Tan"),
        CardView(image: "natural-language-api", category: "iOS", heading: "What's New in Natural Language API", author: "Sai Kambampati")
    ]
    
    @State private var show = false
    @State private var currentIndex: Int = 0
    
    var body: some View {
        VStack {
            VStack(alignment: .leading, spacing: 0, content: {
                Text("Reading List")
                .font(.system(size: 70, weight: .black, design: .rounded))
                .padding([.top, .horizontal])
            })
            
            if show {
                cards[currentIndex]
                    .transition(.scaleAndOffset)
            } else {
                cards[currentIndex]
                    .transition(.scaleAndOffset)
            }
        }
        .onTapGesture {
            withAnimation(.spring(duration: 0.5)) {
                if self.currentIndex >= cards.count - 1 {
                    self.currentIndex = 0
                } else {
                    self.currentIndex += 1
                }
                
                self.show.toggle()
            }
        }
        Spacer()
    }
}

#Preview {
    TransitionHomeworkTwo()
}
