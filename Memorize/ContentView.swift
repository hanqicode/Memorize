//
//  ContentView.swift
//  Memorize
//
//  Created by Qi Han on 11/1/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack {
            CardView(isFaceUp: true)
            CardView()
            CardView()
            CardView()
        }
        .padding()
    }
}

struct CardView: View {
    
    var isFaceUp: Bool = false
    
    var body: some View {
        ZStack {
            if isFaceUp {
                RoundedRectangle(cornerRadius: 12)
                    .foregroundStyle(Color.white)
                RoundedRectangle(cornerRadius: 12)
                    .strokeBorder(style: StrokeStyle(lineWidth: 2))
                    .foregroundStyle(Color.orange)
                Text("👻")
                    .font(Font.largeTitle)
            } else {
                RoundedRectangle(cornerRadius: 12)
                    .foregroundStyle(Color.orange)
            }
        }
    }
}

#Preview {
    ContentView()
}
