//
//  ImageDemoView.swift
//  SwiftUIDemo
//
//  Created by Lawrence Wu 吳易隆 on 2024/6/12.
//

import SwiftUI

struct ImageDemoView: View {
    var body: some View {
        VStack(content: {
            ContentCloseView()
            ScrollView {
                VStack {
                    Image(systemName: "cloud.heavyrain")
                        .font(.system(size: 100))
                        .foregroundStyle(.blue)
                        .shadow(color: .gray, radius: 10, x: 0, y: 10)
                    
                    Image("paris")
                        .resizable()
                    //                .ignoresSafeArea(.container, edges: .bottom)
                        .scaledToFit()
                        .frame(width: UIScreen.main.bounds.width)
                        .clipped()
                        .overlay {
                            Rectangle()
                                .foregroundStyle(.black)
                                .opacity(0.5)
                        }
                    
                    Image("paris")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 300)
                        .clipShape(Circle())
                        .opacity(0.5)
                    
                    Image("paris")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 300)
                        .clipShape(Circle())
                        .overlay {
                            Image(systemName: "heart.fill")
                                .font(.system(size: 35))
                                .foregroundStyle(.black)
                                .opacity(0.5)
                        }
                    
                    Image("paris")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 300)
                        .overlay(alignment: .top, content: {
                            Text("If you are lucky enough to have lived in Paris as a young man, then wherever you go for the rest of your life it stays with you, for Paris is a moveable feast.\n\n- Ernest Hemingway")
                                .fontWeight(.heavy)
                                .font(.system(.headline, design: .rounded))
                                .foregroundStyle(.white)
                                .padding()
                                .background(.black)
                                .clipShape(.rect(cornerRadius: 10))
                                .opacity(0.8)
                                .padding()
                        })
                    
                    Image(systemName: "cloud.sun.rain")
                        .font(.system(size: 100))
                        .symbolRenderingMode(.palette)
                        .foregroundStyle(.gray, .yellow, .blue)
                }
            }
        })
    }
}

#Preview {
    ImageDemoView()
}
