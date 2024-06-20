//
//  BaseNavigationBackView.swift
//  SwiftUIDemo
//
//  Created by Lawrence Wu 吳易隆 on 2024/6/20.
//

import SwiftUI

struct BaseNavigationBackView<Content>: View where Content: View {
    
    var content: () -> Content
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        HStack(content: {
            Button(action: {
                dismiss()
            }, label: {
                Image(systemName: "chevron.left")
                    .font(.largeTitle)
                    .foregroundColor(.black)
            })
            .frame(width: 30, height: 30)
            .padding(.leading, 15)
            Spacer()
        })
        .frame(height: 30)
        
        Spacer()
        
        content()
        .navigationBarHidden(true)
        
        Spacer()
    }
}

#Preview {
    BaseNavigationBackView {
        EmptyView()
    }
}
