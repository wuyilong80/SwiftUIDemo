//
//  ContentView.swift
//  SwiftUIDemo
//
//  Created by Lawrence on 2023/1/10.
//

import SwiftUI

struct ContentView: View {
    
    @State var isLoading: Bool = false
    @State var progress: Double = 0.0
    
    @State var recordBegin: Bool = false
    @State var isRecording: Bool = false
    
    var body: some View {
        VStack(content: {
            Spacer()
            ZStack(content: {
                Circle()
                    .stroke(Color(.systemGray5), lineWidth: 15.0)
                    .frame(width: 100, height: 100)
                Circle()
                    .trim(from: 0.0 , to: 0.2)
                    .stroke(.green, lineWidth: 5.0)
                    .frame(width: 100, height: 100)
                    .rotationEffect(Angle(degrees: isLoading ? 360 : 0))
                    .animation(.linear(duration: 0.3).repeatForever(autoreverses: false), value: isLoading)
                    .onAppear(perform: {
                        self.isLoading = true
                    })
            })
            Spacer()
            ZStack(content: {
                RoundedRectangle(cornerRadius: 3.0)
                    .stroke(Color(.systemGray5), lineWidth: 3.0)
                    .frame(width: 250, height: 5)
                    .background(Color(.systemGray5))
                RoundedRectangle(cornerRadius: 3.0)
                    .stroke(Color(.green), lineWidth: 3.0)
                    .frame(width: 30, height: 5)
                    .background(.green)
                    .offset(x: isLoading ? 110 : -110, y: 0)
//                    .animation(.linear(duration: 0.5).repeatForever(autoreverses: false), value: isLoading)
            })
            Spacer()
            ZStack {
                Circle()
                    .stroke(Color(.systemGray5), lineWidth: 10)
                    .frame(width: 100, height: 100)
                Circle()
                    .trim(from: 0, to: progress)
                    .stroke(Color(.green), lineWidth: 10)
                    .frame(width: 100, height: 100)
                    .rotationEffect(Angle(degrees: -90))
                    .overlay {
                        Text("\(Int(progress * 100)) %")
                    }
                    .onAppear(perform: {
                        Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) { time in
                            self.progress += 0.05
                            if self.progress >= 1.0 {
                                time.invalidate()
                            }
                        }
                    })
            }
            Spacer()
            HStack(content: {
                ForEach(0 ..< 5, id: \.self) { index in
                    Circle()
                        .frame(width: 10, height: 10)
                        .foregroundStyle(self.isLoading ? .green : .blue)
                        .scaleEffect(self.isLoading ? 0 : 1)
                        .animation(.linear(duration: 1.0).repeatForever().delay(0.2 * Double(index)), value: isLoading)
                }
            })
            Spacer()
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
            Spacer()
        })
        
    }
    
    //    @State private var circleColorChanged = false
    //    @State private var heartColorChanged = false
    //    @State private var heartSizeChanged = false
    //
    //    var body: some View {
    //
    //        ZStack {
    //            Circle()
    //                .frame(width: 200, height: 200)
    //                .foregroundColor(circleColorChanged ? Color(.systemGray5) : .red)
    //
    //            Image(systemName: "heart.fill")
    //                .foregroundColor(heartColorChanged ? .red : .white)
    //                .font(.system(size: 100))
    //                .scaleEffect(heartSizeChanged ? 1.0 : 0.5)
    //        }
    ////        .animation(.spring(response: 0.3, dampingFraction: 0.3, blendDuration: 0.3), value: circleColorChanged)
    ////        .animation(.default, value: circleColorChanged)
    //        .onTapGesture {
    //            withAnimation(.default) {
    //                self.circleColorChanged.toggle()
    //                self.heartColorChanged.toggle()
    //            }
    //            self.heartSizeChanged.toggle()
    //        }
    //
    //    }
    //    private var purpleGradient = LinearGradient(gradient: Gradient(colors: [Color(red: 207/255, green: 150/255, blue: 207/255), Color(red: 107/255, green: 116/255, blue: 179/255)]), startPoint: .trailing, endPoint: .leading)
    //
    //    var body: some View {
    //        ZStack(alignment: .center, content: {
    //            Circle()
    //                .trim(from: 0, to: 0.4)
    //                .stroke(Color(.red), lineWidth: 50)
    //            Circle()
    //                .trim(from: 0.4, to: 0.45)
    //                .stroke(Color(.orange), lineWidth: 50)
    //
    //            Circle()
    //                .trim(from: 0.45, to: 0.76)
    //                .stroke(Color(.yellow), lineWidth: 50)
    //
    //            Circle()
    //                .trim(from: 0.76, to: 1)
    //                .stroke(Color(.green), lineWidth: 65)
    //                .offset(CGSize(width: 5, height: -5))
    //        })
    //        .frame(width: 300, height: 300)
    //    }
    
    //    @State private var counter1: Int = 0
    //    @State private var counter2: Int = 0
    //    @State private var counter3: Int = 0
    
    //    var body: some View {
//            Path({ path in
    //            path.move(to: CGPoint(x: 10, y: 10))
    //            path.addQuadCurve(to: CGPoint(x: 210, y: 10), control: CGPoint(x: 100, y: 0))
    //            path.addRect(CGRect(x: 10, y: 10, width: 210, height: 50))
    ////            path.addLine(to: CGPoint(x: 210, y: 50))
    ////            path.addLine(to: CGPoint(x: 10, y: 50))
    //        }).fill(.green)
    
    
    /*
     ZStack(alignment: .center, content: {
     //            Path({ path in
     //                path.move(to: CGPoint(x: 20, y: 60))
     //                path.addLine(to: CGPoint(x: 40, y: 60))
     //                path.addQuadCurve(to: CGPoint(x: 160, y: 60), control: CGPoint(x: 100, y: 0))
     //                path.addLine(to: CGPoint(x: 180, y: 60))
     //                path.addLine(to: CGPoint(x: 180, y: 120))
     //                path.addLine(to: CGPoint(x: 120, y: 120))
     //                path.addLine(to: CGPoint(x: 20, y: 120))
     //                path.closeSubpath()
     //            }).fill(.red)
     
     //            Path({ path in
     //                path.move(to: CGPoint(x: 20, y: 60))
     //                path.addLine(to: CGPoint(x: 40, y: 60))
     //                path.addQuadCurve(to: CGPoint(x: 160, y: 60), control: CGPoint(x: 100, y: 0))
     //                path.addLine(to: CGPoint(x: 180, y: 60))
     //                path.addLine(to: CGPoint(x: 180, y: 120))
     //                path.addLine(to: CGPoint(x: 120, y: 120))
     //                path.addLine(to: CGPoint(x: 20, y: 120))
     //                path.closeSubpath()
     //            }).stroke(.black, lineWidth: 3.0)
     
     Path({ path in
     path.move(to: CGPoint(x: 200, y: 200))
     path.addArc(center: CGPoint(x: 200, y: 200), radius: 150, startAngle: .degrees(270), endAngle: .degrees(90), clockwise: true)
     }).fill(.blue)
     
     Path({ path in
     path.move(to: CGPoint(x: 200, y: 200))
     path.addArc(center: CGPoint(x: 200, y: 200), radius: 150, startAngle: .degrees(90), endAngle: .degrees(270), clockwise: true)
     })
     .fill(.green)
     .offset(CGSize(width: 20, height: 0))
     
     Path({ path in
     path.move(to: CGPoint(x: 200, y: 200))
     path.addArc(center: CGPoint(x: 200, y: 200), radius: 150, startAngle: .degrees(90), endAngle: .degrees(270), clockwise: true)
     path.closeSubpath()
     })
     .stroke(lineWidth: 10)
     .offset(CGSize(width: 20, height: 0))
     .overlay {
     Text("50%")
     .font(.system(.largeTitle, design: .rounded))
     .bold()
     .foregroundColor(.white)
     .offset(x: 0, y: 0)
     }
     //            Text("\(counter1 + counter2 + counter3)")
     //                .font(.system(size: 150, weight: .bold, design: .rounded))
     //            HStack(content: {
     //                CounterButton(counter: $counter1, color: .blue)
     //                CounterButton(counter: $counter2, color: .red)
     //                CounterButton(counter: $counter3, color: .green)
     //            })
     })
     .background(.red)
     */
    //    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//struct CounterButton: View {
//    
//    @Binding var counter: Int
//    var color: Color
//    
//    var body: some View {
//        Button {
//            self.counter += 1
//        } label: {
//            Circle()
//                .frame(width: 120, height: 120)
//                .foregroundColor(color)
//                .overlay {
//                    Text("\(self.counter)")
//                        .font(.system(size: 80, weight: .medium, design: .rounded))
//                        .foregroundStyle(.white)
//                }
//        }
//    }
//}
