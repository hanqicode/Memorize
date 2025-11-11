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
            let cardA = CardModel(id: "\(index)a", content: content)
            let cardB = CardModel(id: "\(index)b", content: content)
            cards.append(contentsOf: [cardA, cardB])
        }

        // Shuffles the cards array after initialization.
        self.shuffle()
    }

    mutating func shuffle() {
        cards.shuffle()
    }
}
