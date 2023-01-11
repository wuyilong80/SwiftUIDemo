//
//  ContentView.swift
//  SwiftUIDemo
//
//  Created by Lawrence on 2023/1/10.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Stay hungry, Stay Foolsh.\n**This is how you bold a text**. *This is how you make text italic.* You can[click this link](https://www.appcoda.com) to go to appcoda.com").fontWeight(.bold).font(.custom("MoonDance", size: 25)).foregroundColor(.red).multilineTextAlignment(.center).lineLimit(nil).truncationMode(.middle).lineSpacing(5).shadow(color: .gray, radius: 2, x: 0, y: 5)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
