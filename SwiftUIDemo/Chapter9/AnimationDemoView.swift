//
//  AnimationDemoView.swift
//  SwiftUIDemo
//
//  Created by Lawrence Wu 吳易隆 on 2024/6/20.
//

import SwiftUI

struct AnimationDemoView: View {
    var body: some View {
        VStack(content: {
            ContentCloseView()
            NavigationView(content: {
                List {
                    NavigationLink {
                        ImplicitAnimation()
                    } label: {
                        Text("Implicit")
                    }
                    
                    NavigationLink {
                        ExplicitAnimation()
                    } label: {
                        Text("Explicit")
                    }
                    
                    NavigationLink {
                        RotationEffectAnimation()
                    } label: {
                        Text("Rotation Effect")
                    }
                    
                    NavigationLink {
                        RectangleProgressAnimation()
                    } label: {
                        Text("Rectangle Progress")
                    }
                    
                    NavigationLink {
                        ProgressIndicatorAnimation()
                    } label: {
                        Text("Progress Indicator")
                    }
                    
                    NavigationLink {
                        DelayAnimation()
                    } label: {
                        Text("Delay")
                    }
                    
                    NavigationLink {
                        TransformAnimation()
                    } label: {
                        Text("Transform")
                    }
                    
                    NavigationLink {
                        TransitionDemoView()
                    } label: {
                        Text("Transition")
                    }
                    
                    NavigationLink {
                        TransitionHomeworkOne()
                    } label: {
                        Text("Transition Homework 1")
                    }
                    
                    NavigationLink {
                        TransitionHomeworkTwo()
                    } label: {
                        Text("Transition Homework 2")
                    }
                }
            })
        })
    }
}

#Preview {
    AnimationDemoView()
}
