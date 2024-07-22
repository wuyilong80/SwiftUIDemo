//
//  ButtonDemoView.swift
//  SwiftUIDemo
//
//  Created by Lawrence Wu 吳易隆 on 2024/6/17.
//

import SwiftUI

struct ButtonDemoView: View {
    var body: some View {
        VStack {
            ContentCloseView()
            VStack(spacing: 15, content: {
                Button(action: {
                    print("Hello world tapped")
                }, label: {
                    Text("Hello world")
                        .fontWeight(.bold)
                        .font(.title)
                        .padding()
                        .background(.purple)
                        .clipShape(.rect(cornerRadius: 40))
                        .foregroundStyle(.white)
                        .padding(10)
                        .overlay {
                            RoundedRectangle(cornerRadius: 40)
                                .stroke(.purple, lineWidth: 5)
                        }
                })
                
                Button(action: {
                    print("Delete button tapped")
                }, label: {
                    HStack {
                        Image(systemName: "trash")
                            .font(.title)
                        Text("Delete")
                            .font(.title)
                            .fontWeight(.semibold)
                    }
                    .padding()
                    .foregroundStyle(.white)
                    .background(.red)
                    .clipShape(.rect(cornerRadius: 40))
                })
                
                Button {
                    print("Delete button tapped")
                } label: {
                    Label {
                        Text("Delete")
                            .font(.title)
                            .fontWeight(.semibold)
                    } icon: {
                        Image(systemName: "trash")
                            .font(.title)
                    }
                }
                .buttonStyle(GradientBackgroundStyle())
                
                Button(action: {
                    print("Button Rotate")
                }, label: {
                    Image(systemName: "plus")
                        .font(.largeTitle)
                        .padding()
                        .foregroundStyle(.white)
                        .background(.purple)
                        .clipShape(Circle())
                })
                .buttonStyle(RotateButton())
            })
        }
    }
}

struct GradientBackgroundStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(minWidth: 0, maxWidth: .infinity)
            .padding()
            .foregroundStyle(.white)
            .background(LinearGradient(gradient: Gradient(colors: [.red, .orange]), startPoint: .leading, endPoint: .trailing))
            .clipShape(.rect(cornerRadius: 40))
            .padding(.horizontal, 20)
            .scaleEffect(configuration.isPressed ? 0.9 : 1)
    }
}

struct RotateButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .rotationEffect(configuration.isPressed ? .degrees(45) : .degrees(0))
    }
}

#Preview {
    ButtonDemoView()
}
