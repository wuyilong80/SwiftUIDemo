//
//  ContentView.swift
//  SwiftUIDemo
//
//  Created by Lawrence on 2023/1/10.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            VStack(alignment: .leading) {
                HStack {
                    VStack(alignment: .leading) {
                        Text("Friday, Jan 13")
                            .font(.caption)
                            .foregroundColor(.secondary)
                        Text("Your Reading")
                            .font(.title)
                            .fontDesign(.rounded)
                            .fontWeight(.black)
                    }
                    Spacer()
                }
                .padding([.leading, .trailing])
                
                HStack(alignment: .top) {
                    Group{
                        CardView(image: "swiftui-button", category: "SwiftUI", heading: "Drawing a Border with Rounded Corners", author: "Lawrence Wu")
                        CardView(image: "flutter-app", category: "flutter", heading: "Bilding a Complex Layout with Flutter", author: "Lawrence Wu")
                        CardView(image: "macos-programming", category: "macOS", heading: "Bilding a Simple Editing App", author: "Lawrence Wu")
                        CardView(image: "natural-language-api", category: "iOS", heading: "What's New in Natural Language API", author: "Lawrence Wu")
                    }
                    .frame(width: 300)
                }
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
