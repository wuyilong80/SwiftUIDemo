//
//  ListDemoView.swift
//  SwiftUIDemo
//
//  Created by Lawrence Wu 吳易隆 on 2024/6/27.
//

import SwiftUI

struct ListDemoView: View {
    var body: some View {
        ZStack(alignment: .top, content: {
            NavigationView(content: {
                List {
                    NavigationLink {
                        ListView()
                    } label: {
                        Text("Resturant List View")
                    }
                    
                    NavigationLink {
                        ListHomework()
                    } label: {
                        Text("Homework")
                    }
                }
            })
            ContentCloseView()
        })
    }
}

#Preview {
    ListDemoView()
}
