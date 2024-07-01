//
//  ListView.swift
//  SwiftUIDemo
//
//  Created by Lawrence Wu 吳易隆 on 2024/6/27.
//

import SwiftUI

struct ListView: View {
    var body: some View {
        /// if data confirm Identifiable protocol, can not use id paramters to init List.
//        List(restaurants, id: \.id) { restaurant in
//        List(restaurants) { restaurant in
//            FullImageRow(restaurant: restaurant)
//        }
//        .listStyle(.plain)
        
        List {
            ForEach(restaurants.indices) { index in
                if (0...1).contains(index) {
                    FullImageRow(restaurant: restaurants[index])
                } else {
                    BasicImageRow(restaurant: restaurants[index])
                }
            }
            .listRowSeparator(.hidden, edges: .bottom)
        }
        .listStyle(.plain)
    }
}

#Preview {
    ListView()
}
