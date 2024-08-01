//
//  WalletTransaction.swift
//  SwiftUIDemo
//
//  Created by Lawrence Wu 吳易隆 on 2024/8/1.
//

import Foundation

struct WalletTransaction: Identifiable {
    var id = UUID()
    var merchant: String
    var amount: Double
    var date: String
    var icon: String = "dollarsign.circle.fill"
}

let testTransactions = [
    WalletTransaction(merchant: "Mushroom", amount: 120.0, date: "11/2/2020", icon: "star.circle.fill"),
    WalletTransaction(merchant: "Amazon", amount: 50.0, date: "10/2/2020", icon: "cart.fill"),
    WalletTransaction(merchant: "MUJI", amount: 300.0, date: "8/2/2020", icon: "app.gift.fill"),
    WalletTransaction(merchant: "Apple", amount: 800.0, date: "4/2/2020", icon: "headphones"),
    WalletTransaction(merchant: "Netflix", amount: 19.0, date: "11/2/2020", icon: "tv"),
    WalletTransaction(merchant: "ANA", amount: 480.0, date: "11/2/2020", icon: "airplane")
]
