//
//  ListHomework.swift
//  SwiftUIDemo
//
//  Created by Lawrence Wu 吳易隆 on 2024/6/27.
//

import SwiftUI

struct ListHomework: View {
    var body: some View {
        List {
            ForEach(articles) { article in
                ArticleListView(article: article)
            }
        }
        .listStyle(.plain)
    }
}

#Preview {
    ListHomework()
}
