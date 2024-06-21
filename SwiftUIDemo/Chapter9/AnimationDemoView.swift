//
//  AnimationDemoView.swift
//  SwiftUIDemo
//
//  Created by Lawrence Wu 吳易隆 on 2024/6/20.
//

import SwiftUI

struct AnimationDemoView: View {
    var body: some View {
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
                    BaseNavigationBackView {
                        RotationEffectAnimation()
                    }
                    
                } label: {
                    Text("Rotation Effect")
                }

                NavigationLink {
                    BaseNavigationBackView {
                        RectangleProgressAnimation()
                    }
                } label: {
                    Text("Rectangle Progress")
                }

                NavigationLink {
                    BaseNavigationBackView {
                        ProgressIndicatorAnimation()
                    }
                } label: {
                    Text("Progress Indicator")
                }

                NavigationLink {
                    BaseNavigationBackView {
                        DelayAnimation()
                    }
                } label: {
                    Text("Delay")
                }
                
                NavigationLink {
                    BaseNavigationBackView {
                        TransformAnimation()
                    }
                } label: {
                    Text("Transform")
                }
                
                NavigationLink {
                    BaseNavigationBackView {
                        TransitionDemoView()
                    }
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
    }
}

#Preview {
    AnimationDemoView()
}
