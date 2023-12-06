//
//  TransitionView.swift
//  SwiftUIDemo
//
//  Created by Lawrence Wu 吳易隆 on 2023/12/5.
//

import SwiftUI

struct TransitionView: View {
    
    @State var show: Bool = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0, content: {
            Text("Reading List")
                .font(.system(size: 70, weight: .black, design: .rounded))
                .padding([.top, .horizontal])
            if show {
                CardView(image: "flutter-app", category: "flutter", heading: "Drawing a Border with Rounded Corners", author: "Lawrence Wu")
                    .transition(.scale(scale: 0, anchor: .bottom))
            } else {
                CardView(image: "swiftui-button", category: "SwiftUI", heading: "Drawing a Border with Rounded Corners", author: "Lawrence Wu")
                    .transition(.scale(scale: 0, anchor: .bottom))
            }
        })
        .onTapGesture {
            withAnimation(.spring(duration: 0.5)) {
                self.show.toggle()
            }
        }
    }
    
    /*
     //    @State var submitted: Bool = true
     @State var isProcessing: Bool = false
     @State var isLoading: Bool = false
     @State var isCompleted: Bool = false
     
     var body: some View {
     ZStack(content: {
     RoundedRectangle(cornerRadius: 25.0)
     .frame(width: isProcessing ? 250 : 200, height: 50)
     .foregroundStyle(isCompleted ? .red : .green)
     .overlay {
     HStack(content: {
     if isProcessing {
     Circle()
     .trim(from: 0, to: 0.75)
     .stroke(.white, lineWidth: 3.0)
     .frame(width: 20, height: 20)
     .rotationEffect(Angle(degrees: isLoading ? 360 : 0))
     .onAppear(perform: {
     withAnimation(.linear(duration: 0.5).repeatForever(autoreverses: false)) {
     self.isLoading.toggle()
     }
     })
     }
     Text(isCompleted ? "Done" : isProcessing ? "Processing" : "Submit")
     .font(.system(size: 25, weight: .bold, design: .rounded))
     .foregroundStyle(.white)
     })
     }
     .onTapGesture {
     withAnimation {
     //                        self.isProcessing.toggle()
     self.startProcessing()
     }
     }
     })
     }
     
     private func startProcessing() {
     self.isProcessing = true
     
     DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
     withAnimation {
     self.isCompleted = true
     self.isProcessing = false
     }
     }
     }
     */
    
    /*
    @State var show: Bool = false
    
    var body: some View {
        VStack(content: {
            RoundedRectangle(cornerRadius: 10)
                .frame(width: 300, height: 300)
                .foregroundStyle(.green)
                .overlay {
                    Text("Show Details")
                        .font(.system(size: 30, design: .rounded))
                        .fontWeight(.bold)
                        .foregroundStyle(.white)
                }
            if show {
                RoundedRectangle(cornerRadius: 10)
                    .frame(width: 300, height: 300)
                    .foregroundStyle(.purple)
                    .overlay {
                        Text("Well, Here is the details")
                            .font(.system(size: 30, design: .rounded))
                            .fontWeight(.bold)
                            .foregroundStyle(.white)
                    }
                //                    .transition(.scale(scale: 0, anchor: .bottom))
                //                    .transition(.offset(x: -600, y: 0).combined(with: .scale(scale: 0, anchor: .leading)))
                    .transition(.asymmetric(insertion: .offset(x: -600, y: 0).combined(with: .scale(scale: 0, anchor: .leading)), removal: .offset(x: 600, y: 0).combined(with: .scale(scale: 0, anchor: .trailing))))
                
            }
        })
        .onTapGesture {
            withAnimation(.spring(duration: 0.5)) {
                self.show.toggle()
            }
        }
    }
     */
     
}

#Preview {
    TransitionView()
}
