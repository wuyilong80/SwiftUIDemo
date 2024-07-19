//
//  Chapter17MainView.swift
//  SwiftUIDemo
//
//  Created by Lawrence Wu 吳易隆 on 2024/7/18.
//

import SwiftUI

struct Chapter17MainView: View {
    var body: some View {
        NavigationView(content: {
            List {
                NavigationLink {
                    TapGestureView()
                } label: {
                    Text("TapGesture")
                }
                
                NavigationLink {
                    LongPressGestureView()
                } label: {
                    Text("LongTapGesture")
                }
                
                NavigationLink {
                    DragGestureView()
                } label: {
                    Text("DragGesture")
                }
                
                NavigationLink {
                    CombinationGestureView()
                } label: {
                    Text("CombinationGesture")
                }
                
                NavigationLink {
                    ScalableView {
                        Image(systemName: "headphones")
                            .font(.system(size: 100))
                            .foregroundColor(.purple)
                    }
                } label: {
                    Text("Homework")
                }

            }
        })
    }
}

#Preview {
    Chapter17MainView()
}
