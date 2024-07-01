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
    case chapter7
    case chapter8
    case chapter9
    case chapter10
    case chapter11
    case chapter12
    case chapter13
    case chapter14
    case chapter15
}

struct ContentData: Identifiable {
    var id =  UUID()
    var title: String
    var description: String
    var mode: ContentMode
}
