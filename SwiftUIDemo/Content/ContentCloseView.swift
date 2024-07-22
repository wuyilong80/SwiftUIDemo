//
//  ContentCloseView.swift
//  SwiftUIDemo
//
//  Created by Lawrence Wu 吳易隆 on 2024/7/22.
//

import SwiftUI

struct ContentCloseView: View {
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        HStack(content: {
            Spacer()
            Button(action: {
                dismiss()
            }, label: {
                Image(systemName: "xmark.circle.fill")
                    .font(.largeTitle)
                    .foregroundColor(.black)
                    .opacity(0.5)
            })
            .frame(width: 30, height: 30)
            .padding(.trailing, 15)
        })
    }
}

#Preview {
    ContentCloseView()
}
