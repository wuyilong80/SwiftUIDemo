//
//  StackDemoView.swift
//  SwiftUIDemo
//
//  Created by Lawrence Wu 吳易隆 on 2024/6/14.
//

import SwiftUI

struct StackDemoView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 15.0) {
                StockHeaderView()
                HStack(spacing: 15.0) {
                    PriceView(title: "Basic", price: "$9", textColor: .white, backColor: .purple)
                    
                    ZStack{
                        PriceView(title: "Pro", price: "$19", textColor: .black, backColor: Color(red: 240/255, green: 240/255, blue: 240/255))
                        
                        Text("Best for designer")
                            .font(.system(.caption, design: .rounded))
                            .fontWeight(.bold)
                            .foregroundStyle(.white)
                            .padding(5)
                            .background(Color(red: 255/255, green: 183/255, blue: 37/255))
                            .offset(x: 0, y: 87)
                    }
                }
                .padding(.horizontal)
                
                ZStack(content: {
                    PriceView(image: "wand.and.rays", title: "Team", price: "$299", textColor: .white, backColor: .black)
                        .padding(.horizontal)
                    
                    Text("Perfect for teams with 20 members")
                        .font(.system(.caption, design: .rounded))
                        .fontWeight(.bold)
                        .foregroundStyle(.white)
                        .padding(5)
                        .background(Color(red: 255/255, green: 183/255, blue: 37/255))
                        .offset(x: 0, y: 110)
                })
            }
            Spacer(minLength:300)
            
            ZStack(content: {
                PriceView(image: "burst.fill", title: "Basic", price: "$9", textColor: .white, backColor: .purple)
                    .padding()
                    .offset(x: 0, y: 180)
                
                PriceView(image: "dial", title: "Pro", price: "$19", textColor: .white, backColor: Color(red: 255/255, green: 183/255, blue: 37/255))
                    .padding()
                    .scaleEffect(0.95)
                
                PriceView(image: "wand.and.rays", title: "Team", price: "$299", textColor: .white, backColor: Color(red: 62/255, green: 63/255, blue: 70/255))
                    .padding()
                    .scaleEffect(0.9)
                    .offset(x: 0, y: -180)
            })
            
            Spacer(minLength: 300)
        }
    }
}

#Preview {
    StackDemoView()
}

/*
 call option menu(double finger on magicpad),
 can that some view embed in some view or extract view to independent view.
 */

struct StockHeaderView: View {
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 10.0, content: {
                Text("Choose")
                    .font(.system(.largeTitle, design: .rounded))
                    .fontWeight(.black)
                Text("Your Plan")
                    .font(.system(.largeTitle, design: .rounded))
                    .fontWeight(.black)
            })
            Spacer()
        }
        .padding()
    }
}

struct PriceView: View {
    var image: String?
    var title: String
    var price: String
    var textColor: Color
    var backColor: Color
    
    var body: some View {
        VStack {
            if let image = image {
                Image(systemName: image)
                    .font(.largeTitle)
                    .foregroundStyle(textColor)
            }
            
            Text(title)
                .font(.system(.title, design: .rounded))
                .fontWeight(.black)
                .foregroundStyle(textColor)
            Text(price)
                .font(.system(size: 40, weight: .heavy, design: .rounded))
                .foregroundStyle(textColor)
            Text("per month")
                .font(.headline)
                .foregroundStyle(textColor)
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 100)
        .padding(40)
        .background(backColor)
        .clipShape(.rect(cornerRadius: 10))
    }
}
