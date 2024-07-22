//
//  Chapter18MainView.swift
//  SwiftUIDemo
//
//  Created by Lawrence Wu 吳易隆 on 2024/7/19.
//

import SwiftUI

struct Chapter18MainView: View {
    
    @State private var showDetail = false
    @State private var selectedRestaurant: NewRestaurant?
    
    var body: some View {
        ZStack(content: {
            NavigationView(content: {
                List {
                    ForEach(newRestaurants) { restaurant in
                        NewBasicImageRow(restaurant: restaurant)
                            .onTapGesture {
                                self.showDetail = true
                                self.selectedRestaurant = restaurant
                            }
                    }
                }
                .listStyle(.plain)
                .navigationTitle("Restaurant")
            })
            .offset(y: showDetail ? -100 : 0)
            .animation(.easeOut(duration: 0.2))
            
            if showDetail {
                BlankView(bgColor: .black)
                    .opacity(0.5)
                    .onTapGesture {
                        self.showDetail = false
                    }
                
                if let restaurant = selectedRestaurant {
                    RestaurantBottomSheet(restautant: restaurant, isShow: $showDetail)
                        .transition(.move(edge: .bottom))
                }
            }
        })
    }
}

#Preview {
    Chapter18MainView()
}

struct BlankView: View {
    
    var bgColor: Color
    
    var body: some View {
        VStack {
            Spacer()
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        .background(bgColor)
        .edgesIgnoringSafeArea(.all)
    }
}
