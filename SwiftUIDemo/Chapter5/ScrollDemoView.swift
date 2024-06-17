//
//  ScrollDemoView.swift
//  SwiftUIDemo
//
//  Created by Lawrence Wu 吳易隆 on 2024/6/17.
//

import SwiftUI

struct ScrollDemoView: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                VStack(alignment: .leading) {
                    Text("Monday, Aug 20")
                        .foregroundStyle(.gray)
                    Text("Your Reading")
                        .font(.system(.largeTitle, design: .rounded))
                        .fontWeight(.black)
                }
                Spacer()
            }
            .padding(.horizontal)
            
            HStack {
                Group {
                    CardView(image: "swiftui-button", category: "SwiftUI", heading: "Drawing a Border with Rounded Corners", author: "Simon Ng")
                    CardView(image: "macos-programming", category: "macOS", heading: "Building a Simple Editing App", author: "Gabriel Theodoropoulos")
                    CardView(image: "flutter-app", category: "Flutter", heading: "Building a Complex Layout with Flutter", author: "Lawrence Tan")
                    CardView(image: "natural-language-api", category: "iOS", heading: "What's New in Natural Language API", author: "Sai Kambampati")
                }
                .frame(width: 300)
            }
            Spacer()
        }
    }
}

#Preview {
    ScrollDemoView()
}
