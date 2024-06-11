//
//  ContentData.swift
//  SwiftUIDemo
//
//  Created by Lawrence Wu 吳易隆 on 2024/6/11.
//

import Foundation

enum ContentMode {
    case chapter1
    case chapter2
    case chapter3
    case chapter4
    case chapter5
    case chapter6
}

struct ContentData: Identifiable {
    var id =  UUID()
    var title: String
    var description: String
    var mode: ContentMode
    
}