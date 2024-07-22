//
//  ContentListView.swift
//  SwiftUIDemo
//
//  Created by Lawrence Wu 吳易隆 on 2024/6/11.
//

import SwiftUI

struct ContentListView: View {
    
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
                content.contentView
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
