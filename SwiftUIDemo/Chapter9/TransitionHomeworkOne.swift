//
//  TransitionHomeworkOne.swift
//  SwiftUIDemo
//
//  Created by Lawrence Wu 吳易隆 on 2024/6/21.
//

import SwiftUI

struct TransitionHomeworkOne: View {

    enum ButtonStatus: String {
        case submit = "Submit"
        case processing = "Processing"
        case done = "Done"
    }
    
    @State private var status: ButtonStatus = .submit
    @State private var isLoading = false
    
    var body: some View {
        RoundedRectangle(cornerRadius: 30)
            .frame(width: self.status == .processing ? 250 : 200, height: 60)
            .foregroundStyle(self.status == .done ? .red : .green)
            .overlay {
                HStack(spacing: 10, content: {
                    if status == .processing {
                        Circle()
                            .trim(from: 0.0 , to: 0.8)
                            .stroke(.white, lineWidth: 3.0)
                            .frame(width: 25, height: 25)
                            .rotationEffect(Angle(degrees: self.isLoading ? 360 : 0))
                            .animation(.linear(duration: 0.5).repeatForever(autoreverses: false), value: self.isLoading)
                            .onAppear(perform: {
                                self.isLoading.toggle()
                            })
                    }
                    
                    Text(status.rawValue)
                        .font(.system(.title, design: .rounded))
                        .bold()
                        .foregroundStyle(.white)
                })
            }
            .onTapGesture {
                withAnimation(.smooth) {
                    self.status = .processing
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                        withAnimation(.smooth) {
                            self.status = .done
                        }
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                            withAnimation(.default) {
                                self.status = .submit
                                self.isLoading = false
                            }
                        }
                    }
                }
            }
    }
}

#Preview {
    TransitionHomeworkOne()
}
