//
//  StackDemoView.swift
//  SwiftUIDemo
//
//  Created by Lawrence Wu 吳易隆 on 2024/6/14.
//

import SwiftUI

struct StackDemoView: View {
    var body: some View {
        VStack {
            HeaderView()
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

struct HeaderView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 10.0, content: {
            Text("Choose")
                .font(.system(.largeTitle, design: .rounded))
                .fontWeight(.black)
            Text("Your Plan")
                .font(.system(.largeTitle, design: .rounded))
                .fontWeight(.black)
        })
    }
}

struct PriceView: View {
    var title: String
    var price: String
    var textColor: Color
    var backColor: Color
    
    var body: some View {
        VStack {
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
