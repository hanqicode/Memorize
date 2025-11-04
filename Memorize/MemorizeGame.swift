//
//  MemorizeGame.swift
//  Memorize
//
//  Created by Qi Han on 11/3/25.
//

import Foundation

struct MemorizeGame<CardContent> {
    var cards: [Card]

    func choose(card: Card) {
        //
    }

    struct Card {
        var isFaceUp: Bool
        var isMatched: Bool
        var content: CardContent
    }
}
