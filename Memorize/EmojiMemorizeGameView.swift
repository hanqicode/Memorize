//
//  EmojiMemorizeGameView.swift
//  Memorize
//
//  Created by Qi Han on 11/1/25.
//

import SwiftUI

struct EmojiMemorizeGameView: View {

    @ObservedObject var viewModel: EmojiMemorizeGame

    var body: some View {
        VStack {
            ScrollView {
                cards
            }
            Button("Shuffle") {
                viewModel.shuffle()
            }
        }
        .padding()
    }

    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 85, maximum: 180))]) {
            // Like Java lambda expression
            // symbol -> {xxxx};
            ForEach(0..<viewModel.cards.count, id: \.self) { index in
                CardView(card: viewModel.cards[index])
                    // fit: 完整显示，不裁切
                    .aspectRatio(2 / 3, contentMode: ContentMode.fit)
            }
        }
    }
}

struct CardView: View {

    var card: MemorizeGame<String>.Card

    init(card: MemorizeGame<String>.Card) {
        self.card = card
    }

    var body: some View {
        ZStack {
            let baseRoundedRectangle = RoundedRectangle(cornerRadius: 12)
            Group {
                baseRoundedRectangle
                    .foregroundStyle(Color.white)
                baseRoundedRectangle
                    .strokeBorder(style: StrokeStyle(lineWidth: 2))
                    .foregroundStyle(Color.orange)
                Text(card.content)
                    .font(Font.system(size: 50))
            }
            // 1 means visible, 0 means transparent.
            .opacity(card.isFaceUp ? 1 : 0)

            baseRoundedRectangle
                .foregroundStyle(Color.orange)
                .opacity(card.isFaceUp ? 0 : 1)
        }
    }
}

#Preview {
    EmojiMemorizeGameView(viewModel: EmojiMemorizeGame())
}
