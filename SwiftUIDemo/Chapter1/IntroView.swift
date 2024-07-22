//
//  IntroView.swift
//  SwiftUIDemo
//
//  Created by Lawrence Wu 吳易隆 on 2024/6/12.
//

import SwiftUI

struct IntroView: View {
    var body: some View {
        VStack(content: {
            ContentCloseView()
        })
        Spacer()
        VStack(spacing: 10, content: {
            Text("This is a Demo App for practice SwiftUI")
                .font(.system(.title3))
            Text("Source with AppCoda - 精通 SwiftUI iOS 15")
                .font(.system(size: 12))
                .foregroundColor(.gray)
        })
        Spacer()
    }
}

#Preview {
    IntroView()
}
