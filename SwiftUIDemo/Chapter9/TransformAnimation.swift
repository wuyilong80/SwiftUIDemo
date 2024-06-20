//
//  TransformAnimation.swift
//  SwiftUIDemo
//
//  Created by Lawrence Wu 吳易隆 on 2024/6/20.
//

import SwiftUI

struct TransformAnimation: View {
    
    @State var recordBegin: Bool = false
    @State var isRecording: Bool = false
    
    var body: some View {
        ZStack(content: {
            RoundedRectangle(cornerRadius: recordBegin ? 30 : 5)
                .frame(width: recordBegin ? 60 : 250, height: 60)
                .foregroundStyle(recordBegin ? .red : .green)
                .overlay {
                    Image(systemName: "mic.fill")
                        .font(.system(.title))
                        .foregroundStyle(.white)
                        .scaleEffect(isRecording ? 0.7 : 1)
                }
            RoundedRectangle(cornerRadius: recordBegin ? 35 : 10)
                .trim(from: 0, to: recordBegin ? 0.0 : 1)
                .stroke(lineWidth: 5.0)
                .frame(width: recordBegin ? 70 : 260, height: 70)
                .foregroundStyle(.green)
        })
        .onTapGesture(perform: {
            withAnimation(.spring) {
                self.recordBegin.toggle()
            }
            withAnimation(.spring.repeatForever().delay(0.5)) {
                self.isRecording.toggle()
            }
        })
    }
}

#Preview {
    TransformAnimation()
}
