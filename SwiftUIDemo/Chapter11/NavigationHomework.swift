//
//  NavigationHomework.swift
//  SwiftUIDemo
//
//  Created by Lawrence Wu 吳易隆 on 2024/7/1.
//

import SwiftUI

struct NavigationHomework: View {
    var body: some View {
        NavigationView(content: {
            List(articles) { article in
                ZStack(content: {
                    ArticleListView(article: article)
                    NavigationLink {
                        ArticleDetailView(article: article)
                    } label: {
                        EmptyView()
                    }
                    .opacity(0)
                })
                .listRowSeparator(.hidden)
            }
            .listStyle(.plain)
            .navigationTitle("Your Reading")
        })
        
    }
}

#Preview {
    NavigationHomework()
}
