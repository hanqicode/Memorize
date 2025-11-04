//
//  ContentView.swift
//  Memorize
//
//  Created by Qi Han on 11/1/25.
//

import SwiftUI

struct ContentView: View {

    private let emojis: [String] = [
        "👻", "🎃", "🕷️", "😈", "🙈", "🎶", "🤡", "👹", "💄", "🐝", "🏀", "🏆",
    ]

    var body: some View {
        ScrollView {
            cards
        }
        .padding()
    }

    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 85, maximum: 180))]) {
            // Like Java lambda expression
            // symbol -> {xxxx};
            ForEach(0..<emojis.count, id: \.self) { index in
                CardView(content: emojis[index])
                    // fit: 完整显示，不裁切
                    .aspectRatio(2 / 3, contentMode: ContentMode.fit)
            }
        }
    }
}

struct CardView: View {

    @State private var isFaceUp: Bool
    private let baseRoundedRectangle: RoundedRectangle
    private let content: String

    init(isFaceUp: Bool = true, content: String) {
        self.isFaceUp = isFaceUp
        self.baseRoundedRectangle = RoundedRectangle(cornerRadius: 12)
        self.content = content
    }

    var body: some View {
        ZStack {
            Group {
                baseRoundedRectangle
                    .foregroundStyle(Color.white)
                baseRoundedRectangle
                    .strokeBorder(style: StrokeStyle(lineWidth: 2))
                    .foregroundStyle(Color.orange)
                Text(content)
                    .font(Font.largeTitle)
            }
            // 1 means visible, 0 means transparent.
            .opacity(isFaceUp ? 1 : 0)

            baseRoundedRectangle
                .foregroundStyle(Color.orange)
                .opacity(isFaceUp ? 0 : 1)
        }.onTapGesture {
            isFaceUp.toggle()
        }
    }
}

#Preview {
    ContentView()
}
