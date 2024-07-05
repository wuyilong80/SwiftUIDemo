//
//  SettingStore.swift
//  SwiftUIDemo
//
//  Created by Lawrence Wu 吳易隆 on 2024/5/10.
//

import Foundation
import Combine

enum DisplayOrderType: Int, CaseIterable {
    case alphabetical
    case favoriteFirst
    case checkInFirst
    
    init(type: Int) {
        switch type {
        case 0: 
            self = .alphabetical
        case 1: 
            self = .favoriteFirst
        case 2: 
            self = .checkInFirst
        default: 
            self = .alphabetical
        }
    }

    var stringValue: String {
        switch self {
        case .alphabetical:
            return "Alphabetical"
        case .favoriteFirst:
            return "Show Favorite First"
        case .checkInFirst:
            return "Show Check-in First"
        }
    }
    
    func predicate() -> ((Restaurant, Restaurant) -> Bool) {
        switch self {
        case .alphabetical:
            return { $0.name < $1.name }
        case .favoriteFirst:
            return { $0.isFavorite && !$1.isFavorite }
        case .checkInFirst:
            return { $0.isCheckIn && !$1.isCheckIn }
        }
    }
}

class SettingStore: ObservableObject {
    
    @Published var showCheckinOnly: Bool = UserDefaults.standard.bool(forKey: "view.preferences.showCheckInOnly") {
        didSet {
            UserDefaults.standard.set(showCheckinOnly, forKey: "view.preferences.showCheckInOnly")
        }
    }
    
    @Published var displayOrder: DisplayOrderType = DisplayOrderType(type: UserDefaults.standard.integer(forKey: "view.preferences.displayOrder")) {
        didSet {
            UserDefaults.standard.set(displayOrder.rawValue, forKey: "view.preferences.displayOrder")
        }
    }
    
    @Published var maxPriceLevel: Int = UserDefaults.standard.integer(forKey: "view.preferences.maxPriceLevel") {
        didSet {
            UserDefaults.standard.set(maxPriceLevel, forKey: "view.preferences.maxPriceLevel")
        }
    }
    
    init() {
        UserDefaults.standard.register(defaults: [
            "view.preferences.showCheckInOnly": false,
            "view.preferences.displayOrder": 0,
            "view.preferences.maxPriceLevel": 5
        ])
    }
}
