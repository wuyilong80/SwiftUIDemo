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
        ContentData(title: "Chapter 6", description: "Use Button", mode: .chapter6)
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
                        TextView()
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
