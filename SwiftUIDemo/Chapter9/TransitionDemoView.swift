//
//  TransitionDemoView.swift
//  SwiftUIDemo
//
//  Created by Lawrence Wu 吳易隆 on 2024/6/21.
//

import SwiftUI

struct TransitionDemoView: View {
    
    @State private var show = false
    
    var body: some View {
        VStack(content: {
            RoundedRectangle(cornerRadius: 10)
                .frame(width: 300, height: 300)
                .foregroundStyle(.green)
                .overlay {
                    Text("Show Details")
                        .font(.system(.largeTitle, design: .rounded))
                        .bold()
                        .foregroundStyle(.white)
                }
            
            if show {
                RoundedRectangle(cornerRadius: 10)
                    .frame(width: 300, height: 300)
                    .foregroundStyle(.purple)
                    .overlay {
                        Text("Well, Here is the details")
                            .font(.system(.largeTitle, design: .rounded))
                            .bold()
                            .foregroundStyle(.white)
                    }
                
                /// simple transition - scale
//                    .transition(.scale(scale: 0, anchor: .leading))
                
                /// simple transition - offset
//                    .transition(.offset(x: -600, y: 0))
                
                /// combine transition - 混合式轉場
//                    .transition(.offset(x: -600, y: 0)
//                        .combined(with: .scale(scale: 0, anchor: .leading)))
                    
                /// asymetric transitions - 不對稱轉場(視圖插入跟移除的動畫不同)
//                    .transition(.asymmetric(insertion: .scale(scale: 0, anchor: .bottom), removal: .offset(x: -600, y: 0)))
                /// make to extension
//                    .transition(.scaleAndOffset)
                    .transition(.leftInRightOut)
            }
        })
        .onTapGesture {
            withAnimation(.spring) {
                self.show.toggle()
            }
        }
    }
}

extension AnyTransition {
    static var scaleAndOffset: AnyTransition {
        AnyTransition.asymmetric(insertion: .scale(scale: 0, anchor: .bottom), removal: .offset(x: -600, y: 0))
    }
    
    static var leftInRightOut: AnyTransition {
        AnyTransition.asymmetric(insertion: .offset(x: -600, y: 0), removal: .offset(x: 600, y: 0))
    }
}

#Preview {
    TransitionDemoView()
}
