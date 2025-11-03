//
//  ContentView.swift
//  Memorize
//
//  Created by Qi Han on 11/1/25.
//

import SwiftUI

struct ContentView: View {

    private let emoji: [String] = [
        "👻", "🎃", "🕷️", "😈", "🙈", "🎶", "🤡", "👹", "💄", "🐝", "🏀", "🏆",
    ]
    @State private var cardCount: Int

    init() {
        cardCount = 4
    }

    var body: some View {
        VStack {
            ScrollView {
                cards
            }

            Spacer()

            cardAdjusters
        }
        .padding()
    }

    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 120, maximum: 180))]) {
            // Like Java lambda expression
            // symbol -> {xxxx};
            ForEach(0..<cardCount, id: \.self) { index in
                CardView(content: emoji[index])
                    // fit: 完整显示，不裁切
                    .aspectRatio(2 / 3, contentMode: ContentMode.fit)
            }
        }
    }

    var cardAdjusters: some View {
        HStack {
            cardRemover

            Spacer()

            cardAdder
        }
        .font(Font.largeTitle)
    }

    var cardRemover: some View {
        Button(
            action: {
                if cardCount > 1 {
                    cardCount -= 1
                }
            },
            label: {
                Image(systemName: "minus.rectangle")
            }
        )
    }

    var cardAdder: some View {
        Button(
            action: {
                if cardCount < emoji.count {
                    cardCount += 1
                }
            },
            label: {
                Image(systemName: "plus.rectangle")
            }
        )
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
