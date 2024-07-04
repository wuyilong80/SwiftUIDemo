//
//  NavigationRestaurantView.swift
//  SwiftUIDemo
//
//  Created by Lawrence Wu 吳易隆 on 2024/7/1.
//

import SwiftUI

struct NavigationRestaurantView: View {
    
    private var restaurants = [
        Restaurant(name: "Cafe Deadend", image: "cafedeadend"),
        Restaurant(name: "Homei", image: "homei"),
        Restaurant(name: "Teakha", image: "teakha"),
        Restaurant(name: "Cafe Loisl", image: "cafeloisl"),
        Restaurant(name: "Petite Oyster", image: "petiteoyster"),
        Restaurant(name: "For Kee Restaurant", image: "forkeerestaurant"),
        Restaurant(name: "Po's Atelier", image: "posatelier"),
        Restaurant(name: "Bourke Street Bakery", image: "bourkestreetbakery"),
        Restaurant(name: "Haigh's Chocolate", image: "haighschocolate"),
        Restaurant(name: "Palomino Espresso", image: "palominoespresso"),
        Restaurant(name: "Upstate", image: "upstate"),
        Restaurant(name: "Traif", image: "traif"),
        Restaurant(name: "Graham Avenue Meats And Deli", image: "grahamavenuemeats"),
        Restaurant(name: "Waffle & Wolf", image: "wafflewolf"),
        Restaurant(name: "Five Leaves", image: "fiveleaves"),
        Restaurant(name: "Cafe Lore", image: "cafelore"),
        Restaurant(name: "Confessional", image: "confessional"),
        Restaurant(name: "Barrafina", image: "barrafina"),
        Restaurant(name: "Donostia", image: "donostia"),
        Restaurant(name: "Royal Oak", image: "royaloak"),
        Restaurant(name: "CASK Pub and Kitchen", image: "caskpubkitchen")
    ]
    
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
