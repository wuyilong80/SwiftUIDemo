//
//  ContentView.swift
//  SwiftUIDemo
//
//  Created by Lawrence on 2023/1/10.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
            ZStack {
                PricingView(title: "Basic", price: "$9", icon: "light.beacon.min", textColor: .white, backColor: .purple)
                    .scaleEffect(0.8)
                    .offset(x:0, y: 150)
                PricingView(title: "Pro", price: "$19", icon: "lightbulb.fill", textColor: .white, backColor: .yellow)
                    .scaleEffect(0.75)
                PricingView(title: "Team", price: "$299", icon: "wand.and.rays", textColor: .white, backColor: Color(red: 62/255, green: 63/255, blue: 70/255))
                    .scaleEffect(0.7)
                    .offset(x:0, y: -150)
            }
        
//        VStack(spacing: 20) {
//            HeaderView()
//            PlanView()
//            ZStack {
//                PricingView(title: "Team", price: "$299", icon: "wand.and.rays", textColor: .white, backColor: Color(red: 62/255, green: 63/255, blue: 70/255))
//                    .padding(.horizontal)
//                TagView(title: "perfect for teams with 20 members").offset(x: 0, y: 87)
//            }
//            Spacer()
//        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct PlanView: View {
    var body: some View {
        HStack {
            PricingView(title: "Basic", price: "$9", textColor: .white, backColor: .purple)
            ZStack {
                PricingView(title: "Pro", price: "$19", textColor: .black, backColor: Color(red: 240/255, green: 240/255, blue: 240/255), optionalColor: .gray)
                TagView(title: "Best for designer").offset(x: 0, y: 87)
            }
        }
        .padding(.horizontal)
    }
}

struct HeaderView: View {
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("Choose")
                    .font(.system(size: 40, weight: .heavy, design: .rounded))
                    .foregroundColor(.black)
                Text("Your Plan").font(.system(size: 40, weight: .heavy, design: .rounded))
                    .foregroundColor(.black)
            }
            Spacer()
        }
        .padding()
    }
}

struct PricingView: View {
    var title: String
    var price: String
    var icon: String?
    var textColor: Color
    var backColor: Color
    var optionalColor: Color?
    
    var body: some View {
        VStack {
            if let icon = icon {
                Image(systemName: icon)
                    .font(.largeTitle)
                    .foregroundColor(textColor)
            }
            Text(title)
                .foregroundColor(textColor)
                .font(.system(size: 25, weight: .bold, design: .rounded))
            Text(price)
                .foregroundColor(textColor)
                .font(.system(size: 35, weight: .heavy, design: .rounded))
            Text("per month")
                .foregroundColor((optionalColor != nil) ? optionalColor : textColor)
                .font(.headline)
        }
        .frame(minWidth: 0, maxWidth: .infinity, maxHeight: 150)
        .padding(40)
        .background(backColor)
        .cornerRadius(10)
    }
}

struct TagView: View {
    var title: String
    
    var body: some View {
        Text(title)
            .foregroundColor(.white)
            .font(.system(.caption, design: .rounded))
            .fontWeight(.bold)
            .padding(5)
            .background(Color(red: 255/255, green: 183/255, blue: 37/255))
    }
}
