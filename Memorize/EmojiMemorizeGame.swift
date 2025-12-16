//
//  EmojiMemorizeGame.swift
//  Memorize
//
//  Created by Qi Han on 11/3/25.
//

import SwiftUI
import Combine

//private let emojis: [String] = [
//    "👻", "🎃", "🕷️", "😈", "🙈", "🎶", "🤡", "👹", "💄", "🐝", "🏀", "🏆",
//]

private let emojis: [String] = [
    "👻", "🎃"
]

private func createCardContent(index: Int) -> String {
    emojis[index]
}

class EmojiMemorizeGame: ObservableObject {

    @Published private var model = MemorizeGame<String>(
        numberOfPairsOfCards: 2,
        cardContentFactory: createCardContent
    )

    var cards: [MemorizeGame<String>.Card] {
        model.cards
    }

    // MARK: - Intents
    func shuffle() {
        model.shuffle()
    }

    func choose(card: MemorizeGame<String>.Card) {
        model.choose(card: card)
    }
}
