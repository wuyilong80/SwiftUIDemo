//
//  ShapeDemoView.swift
//  SwiftUIDemo
//
//  Created by Lawrence Wu 吳易隆 on 2024/6/18.
//

import SwiftUI

struct ShapeDemoView: View {
    var body: some View {
        ZStack(alignment: .top, content: {
            NavigationView(content: {
                List {
                    NavigationLink {
                        Path { path in
                            path.move(to: CGPoint(x: 20, y: 20))
                            path.addLine(to: CGPoint(x: 300, y: 20))
                            path.addLine(to: CGPoint(x: 300, y: 200))
                            path.addLine(to: CGPoint(x: 20, y: 200))
                        }
                        .fill(.green)
                    } label: {
                        Text("FillPath")
                    }
                    
                    NavigationLink {
                        Path { path in
                            path.move(to: CGPoint(x: 20, y: 20))
                            path.addLine(to: CGPoint(x: 300, y: 20))
                            path.addLine(to: CGPoint(x: 300, y: 200))
                            path.addLine(to: CGPoint(x: 20, y: 200))
                            path.closeSubpath()
                        }
                        .stroke(.green, lineWidth: 10.0)

                    } label: {
                        Text("StrokePath")
                    }
                    
                    NavigationLink {
                        ZStack(content: {
                            Path({ path in
                                path.move(to: CGPoint(x: 20, y: 60))
                                path.addLine(to: CGPoint(x: 40, y: 60))
                                path.addQuadCurve(to: CGPoint(x: 210, y: 60), control: CGPoint(x: 125, y: 0))
                                path.addLine(to: CGPoint(x: 230, y: 60))
                                path.addLine(to: CGPoint(x: 230, y: 150))
                                path.addLine(to: CGPoint(x: 20, y: 150))
                            })
                            .fill(.purple)
                            
                            Path({ path in
                                path.move(to: CGPoint(x: 20, y: 60))
                                path.addLine(to: CGPoint(x: 40, y: 60))
                                path.addQuadCurve(to: CGPoint(x: 210, y: 60), control: CGPoint(x: 125, y: 0))
                                path.addLine(to: CGPoint(x: 230, y: 60))
                                path.addLine(to: CGPoint(x: 230, y: 150))
                                path.addLine(to: CGPoint(x: 20, y: 150))
                                path.closeSubpath()
                            })
                            .stroke(lineWidth: 5.0)
                        })

                    } label: {
                        Text("CurvePath")
                    }
                    
                    NavigationLink {
                        Path { path in
                            path.move(to: .init(x: 200, y: 200))
                            path.addArc(center: .init(x: 200, y: 200), radius: 150, startAngle: .degrees(0), endAngle: .degrees(90), clockwise: true)
                        }
                        .fill(.green)
                        
                        ZStack(content: {
                            Path({ path in
                                path.move(to: .init(x: 187, y: 187))
                                path.addArc(center: .init(x: 187, y: 187), radius: 150, startAngle: .degrees(0), endAngle: .degrees(190), clockwise: true)
                            })
                            .fill(.yellow)
                            
                            Path({ path in
                                path.move(to: .init(x: 187, y: 187))
                                path.addArc(center: .init(x: 187, y: 187), radius: 150, startAngle: .degrees(190), endAngle: .degrees(110) , clockwise: true)
                            })
                            .fill(.teal)
                            
                            Path({ path in
                                path.move(to: .init(x: 187, y: 187))
                                path.addArc(center: .init(x: 187, y: 187), radius: 150, startAngle: .degrees(110), endAngle: .degrees(90) , clockwise: true)
                            })
                            .fill(.blue)
                            
                            Path({ path in
                                path.move(to: .init(x: 187, y: 187))
                                path.addArc(center: .init(x: 187, y: 187), radius: 150, startAngle: .degrees(90), endAngle: .degrees(360) , clockwise: true)
                            })
                            .fill(.purple)
                            .offset(x: 20, y: 20)
                            
                            Path({ path in
                                path.move(to: .init(x: 187, y: 187))
                                path.addArc(center: .init(x: 187, y: 187), radius: 150, startAngle: .degrees(90), endAngle: .degrees(360) , clockwise: true)
                                path.closeSubpath()
                            })
                            .stroke(.black, lineWidth: 10)
                            .offset(x: 20, y: 20)
                            .overlay {
                                Text("25%")
                                    .font(.system(.largeTitle, design: .rounded))
                                    .bold()
                                    .foregroundStyle(.white)
                                    .offset(x: 85, y: 85)
                            }
                        })
                        
                    } label: {
                        Text("Arc and Pie")
                    }
                    
                    NavigationLink {
                        VStack(spacing: 30, content: {
                            Button(action: {
                                print("tapped")
                            }, label: {
                                Text("Test")
                                    .font(.system(.title, design: .rounded))
                                    .bold()
                                    .foregroundStyle(.white)
                                    .frame(width: 250, height: 50)
                                    .background(DomeShape().fill(.red))
                            })
                            
                            Text("can make reuse custom shape")
                                .font(.system(.headline))
                                .foregroundStyle(.gray)
                        })
                    } label: {
                        Text("Shape Protocol")
                    }
                    
                    NavigationLink {
                        ProgressShape()
                    } label: {
                        Text("Trim Progress")
                    }
                    
                    NavigationLink {
                        DountChartShape()
                    } label: {
                        Text("Trim Donut Chart")
                    }
                }
            })
            ContentCloseView()
        })
    }
}

#Preview {
    ShapeDemoView()
}
