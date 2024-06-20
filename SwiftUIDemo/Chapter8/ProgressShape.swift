//
//  ProgressShape.swift
//  SwiftUIDemo
//
//  Created by Lawrence Wu 吳易隆 on 2024/6/20.
//

import SwiftUI

struct ProgressShape: View {
    
    private var purpleGradient = LinearGradient(gradient: Gradient(colors: [ Color(red: 207/255, green: 150/255, blue: 207/255), Color(red: 107/255, green: 116/255, blue: 179/255) ]), startPoint: .trailing, endPoint: .leading)
    
    var body: some View {
        ZStack(content: {
            Circle()
                .stroke(Color(.systemGray6), lineWidth: 20)
                .frame(width: 300, height: 300)
            
            Circle()
                .trim(from: 0, to: 0.8)
                .stroke(purpleGradient , lineWidth: 20)
                .frame(width: 300, height: 300)
                .overlay {
                    VStack {
                        Text("85%")
                            .font(.system(size: 80, weight: .bold, design: .rounded))
                            .foregroundColor(.gray)
                        Text("Complete")
                            .font(.system(.body, design: .rounded))
                            .bold()
                            .foregroundColor(.gray)
                    }
                }
        })
    }
}

#Preview {
    ProgressShape()
}
