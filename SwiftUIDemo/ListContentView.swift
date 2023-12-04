//
//  ListContentView.swift
//  SwiftUIDemo
//
//  Created by Lawrence Wu 吳易隆 on 2023/12/1.
//

import SwiftUI

struct ListContentView: View {

//    @State var showDetailView = false
    @State var selectedArticle: Article?
    
    var body: some View {
        NavigationView {
            List {
                ForEach(articles) { article in
                    ArticleListView(article: article)
                        .onTapGesture {
//                            self.showDetailView = true
                            self.selectedArticle = article
                        }
//                    ZStack(content: {
//                        ArticleListView(article: article)
//                        NavigationLink {
//                            ArticleDetailView(article: article)
//                        } label: {
//                            EmptyView()
//                        }
//                        .opacity(0)
//                    })
                }
                .listRowSeparator(.hidden)
                .fullScreenCover(item: $selectedArticle, content: { article in
                    ArticleDetailView(article: article)
                })
                
//                .sheet(item: $selectedArticle, content: { article in
//                    ArticleDetailView(article: article)
//                })
                
//                .sheet(isPresented: $showDetailView, content: {
//                    if let article = self.selectedArticle {
//                        ArticleDetailView(article: article)
//                    }
//                })
            }
            .listStyle(.plain)
            .navigationBarTitle("Your Reading")
        }
    }
}

#Preview {
    ListContentView()
}

struct ArticleListView: View {
    
    var article: Article
    
    var body: some View {
        VStack(alignment: .leading, content: {
            Image(article.image)
                .resizable()
                .scaledToFit()
            Text(article.title)
                .font(.title)
                .fontWeight(.black)
            Text("By \(article.author)")
                .font(.subheadline)
                .foregroundStyle(.secondary)
            Text("stars: \(article.rating)")
                .foregroundStyle(.yellow)
            Text(article.excerpt)
                .font(.body)
                .foregroundStyle(.secondary)
                .lineLimit(4)
        })
    }
}

struct ArticleDetailView: View {
    
    @Environment(\.presentationMode) var presentationMode
    var article: Article
    
    @State private var showAlert = false
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Image(article.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
                Group {
                    Text(article.title)
                        .font(.title)
                        .fontWeight(.black)
                    Text("By \(article.author)")
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                }
                .padding(.bottom, 0)
                .padding(.horizontal)
                                
                Text(article.content)
                    .font(.body)
                    .padding()
                    .lineLimit(10000)
                    .multilineTextAlignment(.leading)
            }
        }
        .ignoresSafeArea(.all, edges: .top)
        .overlay {
            HStack(content: {
                Spacer()
                VStack(content: {
                    Button(action: {
                        self.showAlert = true
                    }) {
                        Image(systemName: "chevron.down.circle.fill")
                            .font(.largeTitle)
                            .foregroundColor(.white)
                    }
                    .padding(.trailing, 20)
                    .padding(.top, 20)
                    Spacer()
                })
            })
        }
        .alert(isPresented: $showAlert, content: {
            Alert(title: Text("Warning"), message: Text("Are you sure you want to leave?"), primaryButton: .default(Text("Yes"), action: {
                presentationMode.wrappedValue.dismiss()
            }), secondaryButton: .cancel())
        })
        
//        .navigationBarBackButtonHidden(true)
//        .toolbar {
//            ToolbarItem(placement: .navigationBarLeading) {
//                Button(action: {
//                    presentationMode.wrappedValue.dismiss()
//                }) {
//                    Image(systemName: "chevron.left.circle.fill")
//                        .font(.largeTitle)
//                        .foregroundColor(.white)
//                }
//            }
//        }
    }
}

#Preview {
    ArticleDetailView(article: articles[0])
}
