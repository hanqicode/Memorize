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
                    .animation(Animation.default, value: viewModel.cards)
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
            ForEach(viewModel.cards) { card in
                CardView(card: card)
                    // fit: 完整显示，不裁切
                    .aspectRatio(2 / 3, contentMode: ContentMode.fit)
                    .padding(4)
                    .onTapGesture {
                        viewModel.choose(card: card)
                    }
            }
        }
    }
}

#Preview {
    EmojiMemorizeGameView(viewModel: EmojiMemorizeGame())
}
