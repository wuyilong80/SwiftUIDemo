//
//  Restaurant.swift
//  SwiftUIDemo
//
//  Created by Lawrence Wu 吳易隆 on 2023/12/4.
//

import UIKit
import SwiftUI

struct Restaurant: Identifiable {
    var id = UUID()
    var name: String
//    var type: String
//    var phone: String
    var image: String
//    var priceLevel: Int
//    var isFavorite: Bool = false
//    var isCheckIn: Bool = false
}

let restaurants = [
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

struct BasicImageRow: View {
    var restaurant: Restaurant
    
    var body: some View {
        HStack(content: {
            Image(restaurant.image)
                .resizable()
                .frame(width: 40, height: 40)
                .clipShape(.rect(cornerRadius: 5))
            Text(restaurant.name)
        })
    }
}

struct FullImageRow: View {
    var restaurant: Restaurant
    
    var body: some View {
        ZStack {
            Image(restaurant.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 200)
                .clipShape(.rect(cornerRadius: 10))
                .overlay {
                    Rectangle()
                        .foregroundStyle(.black)
                        .clipShape(.rect(cornerRadius: 10))
                        .opacity(0.2)
                }
            Text(restaurant.name)
                .font(.system(.title, design: .rounded))
                .fontWeight(.black)
                .foregroundColor(.white)
        }
    }
}

struct RestaurantDetailView: View {
    
    @Environment(\.dismiss) var dismiss
    
    var restaurant: Restaurant
    
    var body: some View {
        VStack {
            Image(restaurant.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            Text(restaurant.name)
                .font(.system(.title, design: .rounded))
                .fontWeight(.black)
            
            Spacer()
        }
        .navigationBarBackButtonHidden(true)
        .toolbar(content: {
            ToolbarItem(placement: .topBarLeading) {
                Button {
                    dismiss()
                } label: {
                    Text("\(Image(systemName: "chevron.left")) \(restaurant.name)")
                            .foregroundColor(.black)
                }
            }
        })
    }
}

