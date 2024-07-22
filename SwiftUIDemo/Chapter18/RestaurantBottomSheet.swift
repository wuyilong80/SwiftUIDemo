//
//  RestaurantBottomSheet.swift
//  SwiftUIDemo
//
//  Created by Lawrence Wu 吳易隆 on 2024/7/22.
//

import SwiftUI

struct RestaurantBottomSheet: View {
    
    enum ViewState {
        case full
        case half
    }
    
    let restautant: NewRestaurant
    @GestureState private var dragState: DragState = .inactive
    @State private var positionOffset: CGFloat = 0.0
    @State private var viewState = ViewState.half
    @State private var scrollOffset: CGFloat = 0.0
    
    @GestureState private var isPressed = false
    
    @Binding var isShow: Bool
    
    var body: some View {
        GeometryReader(content: { geometry in
            VStack {
                Spacer()
                HandlerBar()
                
                ScrollView {
                    TitleBar()
                    NewHeaderView(restaurant: restautant)
                    NewDetailView(icon: "map", info: restautant.location)
                        .padding(.top)
                    NewDetailView(icon: "phone", info: restautant.phone)
                    NewDetailView(icon: nil, info: restautant.description)
                        .padding(.top)
                }
                .background(.white)
                .cornerRadius(10, antialiased: true)
                .disabled(self.viewState == .half && self.dragState.translation.height == 0)
                .coordinateSpace(name: "scrollview")
            }
            .offset(y: geometry.size.height/2 + self.dragState.translation.height + self.positionOffset)
            .offset(y: self.scrollOffset)
            .animation(.interpolatingSpring(stiffness: 200.0, damping: 25.0, initialVelocity: 10.0))
            .edgesIgnoringSafeArea(.all)
            .gesture(
                DragGesture()
                    .updating($dragState, body: { value, state, transcation in
                        state = .dragging(translation: value.translation)
                    })
                    .onEnded({ value in
                        if self.viewState == .half {
                            if value.translation.height < -geometry.size.height * 0.25 {
                                self.positionOffset = -geometry.size.height/2 + 50
                                self.viewState = .full
                            }
                            if value.translation.height > geometry.size.height * 0.3 {
                                self.isShow = false
                            }
                        }
                    })
            )
            .onPreferenceChange(ScrollOffsetKey.self) { value in
                if self.viewState == .full {
                    self.scrollOffset = value > 0 ? value : 0

                    if self.scrollOffset > 120 {
                        self.positionOffset = 0
                        self.scrollOffset = 0
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                            self.viewState = .half
                        }
                    }
                }
            }
        })
    }
}

#Preview {
    RestaurantBottomSheet(restautant: newRestaurants[0], isShow: .constant(true))
        .background(.black.opacity(0.3))
}

struct HandlerBar: View {
    var body: some View {
        Rectangle()
            .frame(width: 50, height: 5)
            .foregroundStyle(Color(.systemGray5))
            .clipShape(.rect(cornerRadius: 10))
    }
}

struct TitleBar: View {
    var body: some View {
        HStack {
            Text("Restaurant Details")
                .font(.headline)
                .foregroundColor(.primary)
            
            Spacer()
        }
        .padding()
    }
}

struct NewHeaderView: View {
    
    let restaurant: NewRestaurant
    
    var body: some View {
        Image(restaurant.image)
            .resizable()
            .scaledToFill()
            .frame(height: 300)
            .clipped()
            .overlay(
                HStack {
                    VStack(alignment: .leading) {
                        Spacer()
                        Text(restaurant.name)
                            .foregroundColor(.white)
                            .font(.system(.largeTitle, design: .rounded))
                            .bold()
                        
                        Text(restaurant.type)
                            .font(.system(.headline, design: .rounded))
                            .padding(5)
                            .foregroundColor(.white)
                            .background(Color.red)
                            .cornerRadius(5)
                        
                    }
                    Spacer()
                }
                    .padding()
            )
    }
}

struct NewDetailView: View {
    let icon: String?
    let info: String
    
    var body: some View  {
        HStack {
            if icon != nil {
                Image(systemName: icon!)
                    .padding(.trailing, 10)
            }
            Text(info)
                .font(.system(.body, design: .rounded))
            
            Spacer()
        }.padding(.horizontal)
    }
}

struct ScrollOffsetKey: PreferenceKey {
    typealias Value = CGFloat
    
    static var defaultValue = CGFloat.zero
    
    static func reduce(value: inout Value, nextValue: () -> Value) {
        value += nextValue()
    }
}
