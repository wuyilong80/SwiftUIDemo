//
//  ContentView.swift
//  SwiftUIDemo
//
//  Created by Lawrence on 2023/1/10.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Button {
            print("is pressed")
        } label: {
            Label {
                
            } icon: {
                Image(systemName: "plus.circle.fill")
                    .font(.largeTitle)
                    .foregroundColor(.purple)
                    .scaleEffect(2)
            }
        }
        .buttonStyle(RotateButtonStyle())
        
//        .background(.black)
        

        
//        VStack(spacing: 30) {
//            Button {
//                print("Hello World!")
//            } label: {
//                Text("Hello World")
//                    .foregroundColor(.white)
//                    .font(.title)
//                    .padding()
//                    .background(.purple)
//                    .cornerRadius(40)
//                    .padding(10)
//                    .overlay {
//                        RoundedRectangle(cornerRadius: 40).stroke(.purple, lineWidth: 5)
//                    }
//            }
//            Button {
//                print("delete something")
//            } label: {
//                Label {
//                    Text("Delete")
//                        .fontWeight(.semibold)
//                        .font(.title)
//                } icon: {
//                    Image(systemName: "trash")
//                        .font(.largeTitle)
//                }
////                .frame(minWidth: 0, maxWidth: .infinity)
////                .padding()
////                .background(LinearGradient(colors: [.red, .blue], startPoint: .leading, endPoint: .trailing))
////                .foregroundColor(.white)
////                .cornerRadius(40)
////                .padding(.horizontal, 20)
////                .shadow(radius: 20)
//            }
//            .buttonStyle(GradientBackgroundStyle())
//        }
    }
}

struct GradientBackgroundStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .frame(minWidth: 0, maxWidth: .infinity)
            .padding()
            .foregroundColor(.white)
            .background(LinearGradient(gradient: Gradient(colors: [.red, .blue]), startPoint: .leading, endPoint: .trailing))
                .cornerRadius(40)
                .padding(.horizontal, 20)
                .scaleEffect(configuration.isPressed ? 0.8 : 1.0)
    }
}

struct RotateButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .rotationEffect(configuration.isPressed ? .degrees(45) : .degrees(0))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
