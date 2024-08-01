//
//  WalletCard.swift
//  SwiftUIDemo
//
//  Created by Lawrence Wu 吳易隆 on 2024/8/1.
//

import Foundation

enum WalletCardType: String {
    case visa
    case master
    case ae
    case chase
    case discover
}

struct WalletCard: Identifiable {
    var id = UUID()
    var name: String
    var type: WalletCardType
    var number: String
    var expiryDate: String
    var image: String {
        return type.rawValue
    }
}

let testCards = [ WalletCard(name: "James Hayward", type: .visa, number: "4242 4242 4242 4242", expiryDate: "3/23"),
                  WalletCard(name: "Cassie Emily", type: .master, number: "5353 5353 5353 5353", expiryDate: "10/21"),
                  WalletCard(name: "Adam Green", type: .ae, number: "3737 3737 3737 3737", expiryDate: "8/22"),
                  WalletCard(name: "Donald Wayne", type: .chase, number: "6363 6263 6362 6111", expiryDate: "11/23"),
                  WalletCard(name: "Gloria Jane", type: .discover, number: "6011 0009 9013 9424", expiryDate: "5/24")
    ]
