//
//  TinderCardView.swift
//  SwiftUIDemo
//
//  Created by Lawrence Wu 吳易隆 on 2024/7/26.
//

import SwiftUI

struct TinderCardView: View, Identifiable {
    
    let id = UUID()
    let image: String
    let title: String
    
    var body: some View {
        Image(image)
            .resizable()
            .scaledToFill()
            .frame(minWidth: 0, maxWidth: .infinity)
            .cornerRadius(10)
            .padding(.horizontal, 15)
            .overlay(
                
                VStack {
                    
                    Text(title)
                        .font(.system(.headline, design: .rounded))
                        .fontWeight(.bold)
                        .padding(.horizontal, 30)
                        .padding(.vertical, 10)
                        .background(Color.white)
                        .cornerRadius(5)
                }
                    .padding([.bottom], 20)
                
                , alignment: .bottom)
    }
}

#Preview {
    TinderCardView(image: "yosemite-usa", title: "Yosemite, USA")
}
