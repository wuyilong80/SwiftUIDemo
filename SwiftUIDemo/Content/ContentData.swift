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
    case chapter16
    case chapter17
    case chapter18
    case chapter19
    case chapter20
}

struct ContentData: Identifiable {
    var id =  UUID()
    var title: String
    var description: String
    var mode: ContentMode
}

var contents: [ContentData] = [
    ContentData(title: "Chapter 1", description: "Intro", mode: .chapter1),
    ContentData(title: "Chapter 2", description: "Use Text", mode: .chapter2),
    ContentData(title: "Chapter 3", description: "Use Image", mode: .chapter3),
    ContentData(title: "Chapter 4", description: "Use Stack", mode: .chapter4),
    ContentData(title: "Chapter 5", description: "Use Scroll View", mode: .chapter5),
    ContentData(title: "Chapter 6", description: "Use Button", mode: .chapter6),
    ContentData(title: "Chapter 7", description: "State and Binding", mode: .chapter7),
    ContentData(title: "Chapter 8", description: "Shape and Path", mode: .chapter8),
    ContentData(title: "Chapter 9", description: "Animation and Transition", mode: .chapter9),
    ContentData(title: "Chapter 10", description: "List、ForEach and Identifiable", mode: .chapter10),
    ContentData(title: "Chapter 11", description: "NavigationView", mode: .chapter11),
    ContentData(title: "Chapter 12", description: "Sheet、Alert", mode: .chapter12),
    ContentData(title: "Chapter 13", description: "Form、Picker、Toggle and Stepper", mode: .chapter13),
    ContentData(title: "Chapter 14", description: "Combine and Environment", mode: .chapter14),
    ContentData(title: "Chapter 15", description: "Combine Advanced", mode: .chapter15),
    ContentData(title: "Chapter 16", description: "Slide Delete、Action Sheet and Context Menu", mode: .chapter16)
]
