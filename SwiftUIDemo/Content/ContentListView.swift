//
//  ContentListView.swift
//  SwiftUIDemo
//
//  Created by Lawrence Wu 吳易隆 on 2024/6/11.
//

import SwiftUI

struct ContentListView: View {
    
    @State var selectedContent: ContentData?
    
    var settingStore = SettingStore()
    
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
                case .chapter10:
                    BaseContainerView(title: content.title) {
                        ListDemoView()
                    }
                case .chapter11:
                    BaseContainerView(title: content.title) {
                        NavigationDemoView()
                    }
                case .chapter12:
                    BaseContainerView(title: content.title) {
                        AlertDemoView()
                    }
                case .chapter13:
                    BaseContainerView(title: content.title) {
                        Chapter13MainView()
                    }
                case .chapter14:
                    BaseContainerView(title: content.title)  {
                        Chapter14MainView().environmentObject(self.settingStore)
                    }
                case .chapter15:
                    BaseContainerView(title: content.title) {
                        Chapter15MainView()
                    }
                case .chapter16:
                    BaseContainerView(title: content.title) {
                        Chapter16MainView()
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
