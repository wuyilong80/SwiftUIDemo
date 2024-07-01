//
//  NavigationRestaurantView.swift
//  SwiftUIDemo
//
//  Created by Lawrence Wu 吳易隆 on 2024/7/1.
//

import SwiftUI

struct NavigationRestaurantView: View {
    
    init() {
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.red, .font: UIFont(name: "ArialRoundedMTBold", size: 35)!]
        navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.red, .font: UIFont(name: "ArialRoundedMTBold", size: 20)!]
        
        let image = UIImage(systemName: "arrow.turn.up.left")!.withTintColor(.black, renderingMode: .alwaysOriginal)
        navBarAppearance.setBackIndicatorImage(image, transitionMaskImage: image)
        
        let buttonAppearance = UIBarButtonItemAppearance()
        buttonAppearance.normal.titleTextAttributes = [
            .foregroundColor: UIColor.black]
        
        navBarAppearance.buttonAppearance = buttonAppearance
        navBarAppearance.backButtonAppearance = buttonAppearance
        navBarAppearance.doneButtonAppearance = buttonAppearance
        
        UINavigationBar.appearance().standardAppearance = navBarAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = navBarAppearance
        UINavigationBar.appearance().compactAppearance = navBarAppearance
    }
    
    var body: some View {
        NavigationView(content: {
            List {
                ForEach(restaurants) { restaurant in
                    NavigationLink {
                        /// set view you want show when tapped
                        RestaurantDetailView(restaurant: restaurant)
                    } label: {
                        /// this cell's view or layout
                        BasicImageRow(restaurant: restaurant)
                    }
                }
            }
            .listStyle(.plain)
            .navigationTitle("Restaurant")
            .navigationBarTitleDisplayMode(.automatic)
        })
    }
}

#Preview {
    NavigationRestaurantView()
}
