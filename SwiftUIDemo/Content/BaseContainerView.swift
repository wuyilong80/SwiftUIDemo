//
//  BaseContainerView.swift
//  SwiftUIDemo
//
//  Created by Lawrence Wu 吳易隆 on 2024/6/11.
//

import SwiftUI

struct BaseContainerView<Content>: View where Content: View {
    
    var title: String
    var content: () -> Content
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack(content: {
            HStack(content: {
                Text(title)
                    .font(.system(.title, design: .rounded))
                    .fontWeight(.bold)
                    .padding(.leading, 15)
                Spacer()
                Button(action: {
                    dismiss()
                }, label: {
                    Image(systemName: "xmark.circle.fill")
                        .font(.largeTitle)
                        .foregroundColor(.black)
                })
                .frame(width: 45, height: 45)
                .padding(.trailing, 15)
            })
            .frame(height: 45)
            Spacer()
            content()
            Spacer()
        })
    }
}

#Preview {
    BaseContainerView(title: "Test Title") {
        VStack {
            EmptyView()
        }
    }
}
