//
//  ContentView.swift
//  SwiftUIDemo
//
//  Created by Lawrence on 2023/1/10.
//

import SwiftUI

struct ContentView: View {
    
    private var purpleGradient = LinearGradient(gradient: Gradient(colors: [Color(red: 207/255, green: 150/255, blue: 207/255), Color(red: 107/255, green: 116/255, blue: 179/255)]), startPoint: .trailing, endPoint: .leading)
    
    var body: some View {
        ZStack(alignment: .center, content: {
            Circle()
                .trim(from: 0, to: 0.4)
                .stroke(Color(.red), lineWidth: 50)
            Circle()
                .trim(from: 0.4, to: 0.45)
                .stroke(Color(.orange), lineWidth: 50)
            
            Circle()
                .trim(from: 0.45, to: 0.76)
                .stroke(Color(.yellow), lineWidth: 50)
            
            Circle()
                .trim(from: 0.76, to: 1)
                .stroke(Color(.green), lineWidth: 65)
                .offset(CGSize(width: 5, height: -5))
        })
        .frame(width: 300, height: 300)
    }
    
//    @State private var counter1: Int = 0
//    @State private var counter2: Int = 0
//    @State private var counter3: Int = 0
    
//    var body: some View {
//        Path({ path in
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

struct CounterButton: View {
    
    @Binding var counter: Int
    var color: Color
    
    var body: some View {
        Button {
            self.counter += 1
        } label: {
            Circle()
                .frame(width: 120, height: 120)
                .foregroundColor(color)
                .overlay {
                    Text("\(self.counter)")
                        .font(.system(size: 80, weight: .medium, design: .rounded))
                        .foregroundStyle(.white)
                }
        }
    }
}
