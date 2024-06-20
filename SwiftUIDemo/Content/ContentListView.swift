//
//  ContentListView.swift
//  SwiftUIDemo
//
//  Created by Lawrence Wu 吳易隆 on 2024/6/11.
//

import SwiftUI

struct ContentListView: View {
    
    private var contents: [ContentData] = [
        ContentData(title: "Chapter 1", description: "Intro", mode: .chapter1),
        ContentData(title: "Chapter 2", description: "Use Text", mode: .chapter2),
        ContentData(title: "Chapter 3", description: "Use Image", mode: .chapter3),
        ContentData(title: "Chapter 4", description: "Use Stack", mode: .chapter4),
        ContentData(title: "Chapter 5", description: "Use Scroll View", mode: .chapter5),
        ContentData(title: "Chapter 6", description: "Use Button", mode: .chapter6),
        ContentData(title: "Chapter 7", description: "State And Binding", mode: .chapter7),
        ContentData(title: "Chapter 8", description: "Shape And Path", mode: .chapter8),
        ContentData(title: "Chapter 9", description: "Animation And Transition", mode: .chapter9),
        ContentData(title: "Chapter 10", description: "--", mode: .chapter10)
    ]
    @State var selectedContent: ContentData?
    
    var body: some View {
        NavigationView(content: {
            List {
                ForEach(contents) { contentData in
                    ContentRowView(contentData: contentData)
                        .onTapGesture {
                            self.selectedContent = contentData
                        }
                }
            }
            .fullScreenCover(item: $selectedContent, content: { content in                
                switch content.mode {
                case .chapter1:
                    BaseContainerView(title: content.title) {
                        IntroView()
                    }
                case .chapter2:
                    BaseContainerView(title: content.title) {
                        TextDemoView()
                    }
                case .chapter3:
                    BaseContainerView(title: content.title) {
                        ImageDemoView()
                    }
                case .chapter4:
                    BaseContainerView(title: content.title) {
                        StackDemoView()
                    }
                case .chapter5:
                    BaseContainerView(title: content.title) {
                        ScrollDemoView()
                    }
                case .chapter6:
                    BaseContainerView(title: content.title) {
                        ButtonDemoView()
                    }
                case .chapter7:
                    BaseContainerView(title: content.title) {
                        StateDemoView()
                    }
                case .chapter8:
                    BaseContainerView(title: content.title) {
                        ShapeDemoView()
                    }
                case .chapter9:
                    BaseContainerView(title: content.title) {
                        AnimationDemoView()
                    }
                default:
                    BaseContainerView(title: content.title) {
                        EmptyView()
                    }
                }
            })
            .navigationTitle("Content")
        })
    }
}

#Preview {
    ContentListView()
}

struct ContentRowView: View {
    var contentData: ContentData
    
    var body: some View {
        HStack(content: {
            VStack(alignment: .leading, content: {
                Text(contentData.title)
                    .fontWeight(.bold)
                    .font(.system(.title, design: .rounded))
                Text(contentData.description)
                    .fontWeight(.medium)
                    .font(.system(.title2, design: .rounded))
                    .foregroundStyle(.gray)
            })
            .padding(3.0)
            Spacer()
        })
        /// make HStack can tap all view
        .contentShape(Rectangle())
    }
}
