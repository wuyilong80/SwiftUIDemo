//
//  AlertDemoView.swift
//  SwiftUIDemo
//
//  Created by Lawrence Wu 吳易隆 on 2024/7/2.
//

import SwiftUI

struct AlertDemoView: View {
    
//    @State var showDetailView = false
    @State var selectedArticle: Article?
    
    var body: some View {
        ZStack(alignment: .top, content: {
            NavigationView(content: {
                List(articles) { article in
                    ArticleListView(article: article)
                        .onTapGesture {
    //                        self.showDetailView = true
                            self.selectedArticle = article
                        }
                    .listRowSeparator(.hidden)
                }
                .listStyle(.plain)
                /// .sheet use Bool control
    //            .sheet(isPresented: $showDetailView, content: {
    //                if let selectedArticle = self.selectedArticle {
    //                    ArticleDetailView(article: selectedArticle)
    //                }
    //            })
                
                /// .sheet use Object control
                .sheet(item: $selectedArticle, content: { article in
                    ArticleDetailPresentView(article: article)
                })
                
                .navigationTitle("Your Reading")
            })
            .navigationViewStyle(.stack)
            ContentCloseView()
        })
    }
}

#Preview {
    AlertDemoView()
}
