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

struct ArticleListView: View {
    var article: Article
    
    var body: some View {
        VStack(alignment: .leading, spacing: 6, content: {
            Image(article.image)
                .resizable()
                .frame(height: 300)
                .clipShape(.rect(cornerRadius: 10))
                
            Text(article.title)
                .font(.system(size: 30, weight: .black, design: .rounded))
            
            Text(article.author)
                .font(.system(size: 20, weight: .medium, design: .rounded))
                .foregroundStyle(.gray)
            
            HStack {
                ForEach(1...article.rating, id: \.self) { index in
                    Image(systemName: "star.fill")
                        .foregroundStyle(.yellow)
                }
            }
            
            Text(article.excerpt)
                .font(.system(size: 18, weight: .regular, design: .rounded))
                .foregroundStyle(.gray)
        })
    }
}
