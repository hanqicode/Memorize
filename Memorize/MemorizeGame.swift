//
//  MemorizeGame.swift
//  Memorize
//
//  Created by Qi Han on 11/3/25.
//

import Foundation

struct MemorizeGame<CardContent> {
    // Only set method is private, but get is pubilc.
    private(set) var cards: [Card]

    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = []
        // add numberOfPairsOfCards * 2 cards
        for pairIndex in 0..<numberOfPairsOfCards {
            let content: CardContent = cardContentFactory(pairIndex)
            cards.append(Card(content: content))
            cards.append(Card(content: content))
        }
    }

    func choose(card: Card) {
        //
    }

    mutating func shuffle() {
        cards.shuffle()
    }

    struct Card {
        var isFaceUp: Bool = true
        var isMatched: Bool = false
        let content: CardContent
    }
}
