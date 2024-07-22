//
//  NavigationDemoView.swift
//  SwiftUIDemo
//
//  Created by Lawrence Wu 吳易隆 on 2024/7/1.
//

import SwiftUI

struct NavigationDemoView: View {
    var body: some View {
        ZStack(alignment: .top) {
            NavigationView(content: {
                List {
                    NavigationLink {
                        NavigationRestaurantView()
                    } label: {
                        Text("RestaurantView")
                    }
                    
                    NavigationLink {
                        NavigationHomework()
                    } label: {
                        Text("Homework")
                    }
                }
            })
            ContentCloseView()
        }
    }
}

#Preview {
    NavigationDemoView()
}
