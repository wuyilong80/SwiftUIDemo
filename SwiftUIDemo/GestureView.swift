//
//  GestureView.swift
//  SwiftUIDemo
//
//  Created by Lawrence Wu 吳易隆 on 2024/6/7.
//

import SwiftUI

enum DragState {
    case inactive
    case pressing
    case dragging(translation: CGSize)
    
    var translation: CGSize {
        switch self {
        case .inactive, .pressing:
            return .zero
        case .dragging(let translation):
            return translation
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

struct GestureView: View {
    // 點擊手勢
//    @State private var isPressed = false
    // 長按手勢
//    @GestureState private var longPressTap = false
    //拖曳手勢
//    @GestureState private var dragOffset = CGSize.zero
    @State private var position = CGSize.zero
    
    @GestureState private var dragState: DragState = .inactive
    
    var body: some View {
        Image(systemName: "star.circle.fill")
            .font(.system(size: 200))
        // 點擊手勢
//            .scaleEffect(isPressed ? 0.5 : 1.0)
//            .offset(/*@START_MENU_TOKEN@*/CGSize(width: 10.0, height: 10.0)/*@END_MENU_TOKEN@*/)
//            .animation(.easeInOut, value: isPressed)
        // 長按手勢
            .opacity(dragState.isPressing ? 0.4: 1.0)
//            .offset(/*@START_MENU_TOKEN@*/CGSize(width: 10.0, height: 10.0)/*@END_MENU_TOKEN@*/)
//            .animation(.easeInOut, value: isPressed)
        //拖曳手勢
            .offset(x: dragState.translation.width + position.width, y: dragState.translation.height + position.height)
            .animation(.easeInOut, value: dragState.translation)
        
            .foregroundColor(.green)
            .gesture(
                /*
                // 點擊手勢
                TapGesture()
                    .onEnded({ _ in
                        self.isPressed.toggle()
                    })
                 */
                
                /*
                // 長按手勢
                LongPressGesture(minimumDuration: 1.0)
                    .updating($longPressTap, body: { currentState, state, transcation in
                        state = currentState
                    })
                    .onEnded({ _ in
                        self.isPressed.toggle()
                    })
                 */
                
                /*
                //拖曳手勢
                DragGesture()
                    .updating($dragOffset, body: { value, state, transcation in
                        state = value.translation
                    })
                    .onEnded({ value in
                        self.position.width += value.translation.width
                        self.position.height += value.translation.height
                    })
                 */
                
                //組合手勢
                LongPressGesture(minimumDuration: 1.0)
//                    .updating($longPressTap, body: { currentState, state, transcation in
//                        state = currentState
//                    })
                    .sequenced(before: DragGesture())
                    .updating($dragState, body: { value, state, transcation in
                        switch value {
                        case .first(true):
                            state = .pressing
                        case .second(true, let drag):
                            state = .dragging(translation: drag?.translation ?? .zero)
                        default:
                            break
                        }
                    })
                    .onEnded({ value in
                        guard case .second(true, let drag?) = value else { return }
                        self.position.width += drag.translation.width
                        self.position.height += drag.translation.height
                    })
            )
    }
}

#Preview {
    GestureView()
}
