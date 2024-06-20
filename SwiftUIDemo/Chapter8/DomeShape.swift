//
//  DomeShape.swift
//  SwiftUIDemo
//
//  Created by Lawrence Wu 吳易隆 on 2024/6/20.
//

import SwiftUI

struct DomeShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: .init(x: 0, y: 0))
        path.addQuadCurve(to: .init(x: rect.size.width, y: 0), control: .init(x: (rect.size.width) / 2, y: -(rect.size.width * 0.1)))
        path.addRect(.init(x: 0, y: 0, width: rect.size.width, height: rect.size.height))
        return path
    }
}

#Preview {
    DomeShape()
}
