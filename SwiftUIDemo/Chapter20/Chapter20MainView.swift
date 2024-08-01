//
//  Chapter20MainView.swift
//  SwiftUIDemo
//
//  Created by Lawrence Wu 吳易隆 on 2024/8/1.
//

import SwiftUI

struct Chapter20MainView: View {
    
    @State var cards: [WalletCard] = testCards
    private static let cardOffset: CGFloat = 50.0
    @State private var isCardPresented = false
    @State var isCardPressed = false
    @State var selectedCard: WalletCard?
    @GestureState private var dragState = DragState.inactive
    
    var body: some View {
        VStack {
            
            TopNavBar()
                .padding(.bottom)
            
            Spacer()
            
            ZStack {
                if isCardPresented {
                    ForEach(cards) { card in
                        WalletCardView(card: card)
                            .offset(self.offset(for: card))
                            .padding(.horizontal, 35)
                            .zIndex(self.zIndex(for: card))
                            .transition(AnyTransition.slide.combined(with: .move(edge: .leading)).combined(with: .opacity))
                            .animation(self.transitionAnimation(for: card))
                            .gesture(
                                TapGesture()
                                    .onEnded({ _ in
                                        withAnimation(.easeOut(duration: 0.15).delay(0.1)) {
                                            self.isCardPressed.toggle()
                                            self.selectedCard = self.isCardPressed ? card : nil
                                        }
                                    })
                                    .exclusively(before: LongPressGesture(minimumDuration: 0.05)
                                        .sequenced(before: DragGesture())
                                        .updating(self.$dragState, body: { (value, state, transaction) in
                                            switch value {
                                            case .first(true):
                                                state = .pressing(index: self.index(for: card))
                                            case .second(true, let drag):
                                                state = .dragging(index: self.index(for: card), translation: drag?.translation ?? .zero)
                                            default:
                                                break
                                            }
                                            
                                        })
                                            .onEnded({ (value) in
                                                
                                                guard case .second(true, let drag?) = value else {
                                                    return
                                                }
                                                
                                                self.rearrangeCards(with: card, dragOffset: drag.translation)
                                            })
                                                 
                                    )
                            )
                    }
                }
            }
            .onAppear(perform: {
                self.isCardPresented.toggle()
            })
            
            if isCardPressed {
                WalletTransactionHistoryView(transactions: testTransactions)
                    .padding(.top, 10)
                    .transition(.move(edge: .bottom))
            }
            
            Spacer()
        }
    }
    
    private func zIndex(for card: WalletCard) -> Double {
        guard let cardIndex = index(for: card) else {
            return 0.0
        }
        
        // 卡片的預設 z-index 設定為卡片索引值的負值，
        // 因此第一張卡片具有最大的 z-index
        let defaultZIndex = -Double(cardIndex)
        
        // 如果它是拖曳的卡片
        if let draggingIndex = dragState.index,
           cardIndex == draggingIndex {
            // 我們根據位移的高度來計算新的 z-index
            return defaultZIndex + Double(dragState.translation.height/Self.cardOffset)
        }
        
        // 否則我們回傳預設的 z-index
        return defaultZIndex
    }
    
    private func index(for card: WalletCard) -> Int? {
        guard let index = cards.firstIndex(where: { $0.id == card.id }) else {
            return nil
        }
        
        return index
    }
    
    private func offset(for card: WalletCard) -> CGSize {
        
        guard let cardIndex = index(for: card) else {
            return CGSize()
        }
        
        if isCardPressed {
            guard let selectedCard = self.selectedCard,
                  let selectedCardIndex = index(for: selectedCard) else {
                return .zero
            }
            
            if cardIndex >= selectedCardIndex {
                return .zero
            }
            
            let offset = CGSize(width: 0, height: 1400)
            
            return offset
        }
        // 處理手勢
        var pressedOffset = CGSize.zero
        var dragOffsetY: CGFloat = 0.0
        
        if let draggingIndex = dragState.index,
           cardIndex == draggingIndex {
            pressedOffset.height = dragState.isPressing ? -20 : 0
            
            switch dragState.translation.width {
            case let width where width < -10: pressedOffset.width = -20
            case let width where width > 10: pressedOffset.width = 20
            default: break
            }
            
            dragOffsetY = dragState.translation.height
        }
        
        return CGSize(width: 0 + pressedOffset.width, height: -50 * CGFloat(cardIndex) + pressedOffset.height + dragOffsetY)
    }
    
    private func transitionAnimation(for card: WalletCard) -> Animation {
        var delay = 0.0
        
        if let index = index(for: card) {
            delay = Double(cards.count - index) * 0.1
        }
        
        return Animation.spring(response: 0.1, dampingFraction: 0.8, blendDuration: 0.02).delay(delay)
    }
    
    private func rearrangeCards(with card: WalletCard, dragOffset: CGSize) {
        guard let draggingCardIndex = index(for: card) else {
            return
        }
        
        var newIndex = draggingCardIndex + Int(-dragOffset.height / Self.cardOffset)
        newIndex = newIndex >= cards.count ? cards.count - 1 : newIndex
        newIndex = newIndex < 0 ? 0 : newIndex
        
        let removedCard = cards.remove(at: draggingCardIndex)
        cards.insert(removedCard, at: newIndex)
        
    }
}

#Preview {
    Chapter20MainView()
}

struct TopNavBar: View {
    
    var body: some View {
        HStack {
            Text("Wallet")
                .font(.system(.largeTitle, design: .rounded))
                .fontWeight(.heavy)
            
            Spacer()
            
            Image(systemName: "plus.circle.fill")
                .font(.system(.title))
        }
        .padding(.horizontal)
        .padding(.top, 20)
    }
}
