//
//  GameModel.swift
//  Memorize
//
//  Created by Qi Han on 11/9/25.
//

import Foundation

struct GameModel {

    private(set) var cards: [CardModel]

    init(themeModel: ThemeModel) {
        cards = []

        // Builds the cards array.
        for index in 0..<themeModel.emojis.count {
            let content = themeModel.emojis[index]
            let cardA = CardModel(id: "\(index + 1)a", content: content)
            let cardB = CardModel(id: "\(index + 1)b", content: content)
            cards.append(contentsOf: [cardA, cardB])
        }

        // Shuffles the cards array after initialization.
        self.shuffle()
    }

    // CardModel is struct type so we cannot modify card directly.
    mutating func choose(card: CardModel) {
        print("Choosing card with id: \(card.id)")
        let chosenIndex = self.index(card: card)
        cards[chosenIndex].isFaceUp.toggle()
    }

    private func index(card: CardModel) -> Int {
        cards.firstIndex(of: card)!
    }

    mutating func shuffle() {
        cards.shuffle()
    }
}
