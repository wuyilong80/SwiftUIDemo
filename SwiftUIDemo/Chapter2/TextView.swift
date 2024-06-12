//
//  TextView.swift
//  SwiftUIDemo
//
//  Created by Lawrence Wu 吳易隆 on 2024/6/12.
//

import SwiftUI

struct TextView: View {
    var body: some View {
        VStack(spacing: 10, content: {
            Text("Stay Hungry. Stay Foolish.")
                .font(.title)
                .fontWeight(.bold)
                        
            Text("Stay Hungry. Stay Foolish.")
                .font(.system(.largeTitle, design: .rounded))
                .fontWeight(.black)
                .foregroundStyle(.green)
          
            Text("Your time is limited, so don’t waste it living someone else’s life. Don’t be trapped by dogma—which is living with the results of other people’s thinking. Don’t let the noise of others’ opinions drown out your own inner voice. And most important, have the courage to follow your heart and intuition.")
                .fontWeight(.bold)
                .font(.title)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .lineLimit(3)
                .lineSpacing(5)
                .padding()
            
            Text("Your time is limited, so don’t waste it living someone else’s life. Don’t be trapped by dogma—which is living with the results of other people’s thinking. Don’t let the noise of others’ opinions drown out your own inner voice. And most important, have the courage to follow your heart and intuition.")
                .fontWeight(.bold)
                .font(.title)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .padding()
                .rotationEffect(.degrees(20), anchor: UnitPoint(x: 0, y: 0))
            
            Text("Your time is limited, so don’t waste it living someone else’s life. Don’t be trapped by dogma—which is living with the results of other people’s thinking. Don’t let the noise of others’ opinions drown out your own inner voice. And most important, have the courage to follow your heart and intuition.")
                .fontWeight(.bold)
                .font(.title)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .padding()
                .rotation3DEffect(.degrees(60), axis: (x: 1, y: 0, z: 0))
                .shadow(color: .gray, radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/, x: 0, y: 15)
            
            /// Not work?
            Text("Font Test")
                .font(.custom("Nunito", size: 25.0))
            
            Text("**This is how you bold a text**. *This is how you make text italic.* You can [click this link](https://www.appcoda.com) to go to appcoda.com")
                .font(.title)
        })
    }
}

#Preview {
    TextView()
}
