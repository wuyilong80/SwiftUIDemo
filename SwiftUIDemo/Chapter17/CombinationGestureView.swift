//
//  CombinationGestureView.swift
//  SwiftUIDemo
//
//  Created by Lawrence Wu 吳易隆 on 2024/7/19.
//

import SwiftUI

enum DragState {
    case inactive
    case pressing(index: Int? = nil)
    case dragging(index: Int? = nil, translation: CGSize)
    
    var index: Int? {
        switch self {
        case .pressing(let index), .dragging(let index, _):
            return index
        case .inactive:
            return nil
        }
    }
    
    var translation: CGSize {
        switch self {
        case .inactive, .pressing:
            return .zero
        case .dragging(_, let translation):
            return translation
        }
    }
    
    var isDragging: Bool {
        switch self {
        case .dragging:
            return true
        case .pressing, .inactive:
            return false
        }
    }
    
    var isPressing: Bool {
        switch self {
        case .pressing, .dragging:
            return true
        case .inactive:
            return false
        }
    }
}

struct CombinationGestureView: View {
    
    @GestureState private var dragState: DragState = .inactive
    @State private var positon = CGSizeZero
    
    var body: some View {
        Image(systemName: "star.circle.fill")
            .font(.system(size: 100))
            .opacity(dragState.isPressing ? 0.5 : 1.0)
            .offset(x: dragState.translation.width + positon.width, y: dragState.translation.height + positon.height)
            .animation(.easeInOut, value: dragState.translation)
            .foregroundColor(.green)
            .gesture(
                LongPressGesture(minimumDuration: 1.0)
                    .sequenced(before: DragGesture())
                    .updating($dragState, body: { value, state, transcation in
                        switch value {
                        case .first(true):
                            state = .pressing()
                        case .second(true, let drag):
                            state = .dragging(translation: drag?.translation ?? .zero)
                        default:
                            break
                        }
                    })
                    .onEnded({ value in
                        guard case .second(true, let drag?) = value else { return }
                        self.positon.width += drag.translation.width
                        self.positon.height += drag.translation.height
                    })
            )
    }
}

#Preview {
    CombinationGestureView()
}
