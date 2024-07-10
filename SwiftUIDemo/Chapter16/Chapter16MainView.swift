//
//  Chapter16MainView.swift
//  SwiftUIDemo
//
//  Created by Lawrence Wu 吳易隆 on 2024/7/9.
//

import SwiftUI

struct Chapter16MainView: View {
    
    @State private var restaurants = [
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
    
    @State private var selectedRestaurant: Restaurant?
    @State private var showActionSheet = false
    
    var body: some View {
        List {
            ForEach(restaurants) { restaurant in
                BasicImageRow(restaurant: restaurant)
                    .contextMenu(ContextMenu(menuItems: {
                        Button(action: {
                            self.delete(item: restaurant)
                        }, label: {
                            HStack(content: {
                                Text("Delete")
                                Image(systemName: "trash")
                            })
                        })
                        
                        Button(action: {
                            self.setFavorite(item: restaurant)
                        }, label: {
                            HStack(content: {
                                Text("Favorite")
                                Image(systemName: "star")
                            })
                        })
                        
                        Button(action: {
                            self.setCheckin(item: restaurant)
                        }, label: {
                            HStack(content: {
                                Text("Check-in")
                                Image(systemName: "checkmark.seal.fill")
                            })
                        })
                    }))
                    .onTapGesture {
                        self.showActionSheet.toggle()
                        self.selectedRestaurant = restaurant
                    }
                    .actionSheet(isPresented: $showActionSheet, content: {
                        ActionSheet(title: Text("What do you want to do"), message: nil, buttons: [
                            .default(Text("Mark as Favorite"), action: {
                                if let selectedRestaurant = self.selectedRestaurant {
                                    self.setFavorite(item: selectedRestaurant)
                                }
                            }),
                            
                            .default(Text("Check-in"), action: {
                                if let selectedRestaurant = self.selectedRestaurant {
                                    self.setCheckin(item: selectedRestaurant)
                                }
                            }),
                            
                            .destructive(Text("Delete"), action: {
                                if let selectedRestaurant = self.selectedRestaurant {
                                    self.delete(item: selectedRestaurant)
                                }
                            }),
                            
                            .cancel()
                        ])
                    })
                
//                    .confirmationDialog("test", isPresented: $showActionSheet) {
//                        Button {
//                            
//                        } label: {
//                            Text("1111")
//                        }
//                        
//                        Button {
//                            
//                        } label: {
//                            Text("2222")
//                        }
//                        
//                        Button {
//                            
//                        } label: {
//                            Text("3333")
//                        }
//
//                    }
            }
            /// onDelete only use on ForEach
            .onDelete(perform: { indexSet in
                self.restaurants.remove(atOffsets: indexSet)
            })
        }
        .listStyle(.plain)
    }
    
    private func delete(item restaurant: Restaurant) {
        if let index = self.restaurants.firstIndex(where: { $0.id == restaurant.id }) {
            self.restaurants.remove(at: index)
        }
    }
    
    private func setFavorite(item restaurant: Restaurant) {
        if let index = self.restaurants.firstIndex(where: { $0.id == restaurant.id }) {
            self.restaurants[index].isFavorite.toggle()
        }
    }
    
    private func setCheckin(item restaurant: Restaurant) {
        if let index = self.restaurants.firstIndex(where: { $0.id == restaurant.id }) {
            self.restaurants[index].isCheckIn.toggle()
        }
    }
}

#Preview {
    Chapter16MainView()
}
