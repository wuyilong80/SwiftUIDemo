//
//  ListDemoView.swift
//  SwiftUIDemo
//
//  Created by Lawrence Wu 吳易隆 on 2024/6/27.
//

import SwiftUI

struct ListDemoView: View {
    var body: some View {
        NavigationView(content: {
            List {
                NavigationLink {
                    BaseNavigationBackView {
                        ListView()
                    }
                } label: {
                    Text("Resturant List View")
                }
                
                NavigationLink {
                    BaseNavigationBackView {
                        ListHomework()
                    }
                } label: {
                    Text("Homework")
                }
            }
        })
    }
}

#Preview {
    ListDemoView()
}
